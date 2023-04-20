import SwiftUI
import SpriteKit

class Runner: SKSpriteNode, BaseballGameObjects {
    var base: String = "None"
    var aRun: [String] = []
    var homePlate = CGPoint(x: 721, y: 1)
    var firstBase = CGPoint(x: 1150, y: 416)
    var secondBase = CGPoint(x: 721, y: 850)
    var thirdBase = CGPoint(x: 286, y: 415)
    
    func setUp() {
        self.name = "Runner"
        self.color = .blue
        self.texture = SKTexture(imageNamed: "Runner1")
        self.size = CGSize(width: 50, height: 74)
//        self.zRotation = -(CGFloat.pi/2)
        self.position = CGPoint(x: 622, y: -4)
    }
    
    func advance(_ platesToRun: Int) {
        var plates = platesToRun
        while plates > 0 {
            switch(self.base) {
            case "First":
                moveTo(self.secondBase)
                self.base = "Second"
                self.aRun.append(self.base)
            case "Second":
                moveTo(self.thirdBase)
                self.base = "Third"
                self.aRun.append(self.base)
            case "Third":
                moveTo(self.homePlate)
                self.base = "Home"
                self.aRun.append(self.base)
            default:
                moveTo(self.firstBase)
                self.base = "First"
                self.aRun.append(self.base)
            }
            plates -= 1
        }
    }
    
    func moveTo(_ base: CGPoint) {
        let baseX = base.x - self.position.x
        let baseY = base.y - self.position.y
        let angle = atan2(baseX, baseY)
        let lookAt = SKAction.rotate(toAngle: angle, duration: 0.2, shortestUnitArc: true)
        
//        let distance = sqrt(baseX*baseX + baseY*baseY)
        let move = SKAction.move(to: base, duration: 0.1)
        let sequence = SKAction.sequence([lookAt, move])
        
        self.run(sequence)
    }
    
}
