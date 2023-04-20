import SwiftUI
import SpriteKit

class Pitcher: SKSpriteNode, BaseballGameObjects {
    var isBallInHand = true
    var alwaysInFrontOfBall = 1.0
    
    func setUp() {
        self.name = "Pitcher"
        self.color = .blue
        self.texture = SKTexture(imageNamed: "Pitcher")
        self.zRotation = -(CGFloat.pi/2)
        self.size = CGSize(width: 50, height: 74)
        self.zPosition = alwaysInFrontOfBall
        //        self.zRotation = -(CGFloat.pi/2)
        
        let w = UIScreen.main.bounds.width
        let h = UIScreen.main.bounds.height
        self.position = CGPoint(x: w/2, y: (h/2)-40)
        
        pitch()
    }
    
    func pitch() {
        let angle = (CGFloat.pi)/3
        let windUp = SKAction.rotate(byAngle: -angle, duration: 5)
        let throwBall = SKAction.rotate(byAngle: angle, duration: 0.1)
        
        let throwBallTowardsBatter = SKAction.sequence([windUp, throwBall])
        self.run(throwBallTowardsBatter)
    }
    
}
