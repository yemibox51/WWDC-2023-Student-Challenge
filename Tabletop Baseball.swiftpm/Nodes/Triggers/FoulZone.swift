import SwiftUI
import SpriteKit

class FoulZone: SKSpriteNode, BaseballGameObjects {
    func setUp() {
        self.name = "FoulZone"
        let fieldColor = UIColor(red: 76.0/255.0, green: 175.0/255.0, blue: 80.0/255.0, alpha: 0.5)
        self.color = fieldColor
        self.size  = CGSize(width: 3000, height: 100)
        self.alpha = CGFloat(1)
        
        self.position = CGPoint(x: -57, y: 500)
        self.zRotation = (CGFloat.pi/4)
        
        setUpPhysics()
    }
    
    private func setUpPhysics() {
        self.physicsBody = SKPhysicsBody(rectangleOf: self.size, center: self.anchorPoint)
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.mass = 115
        self.physicsBody?.pinned = true
        self.physicsBody?.isDynamic = false
        self.physicsBody?.categoryBitMask = BitMask.Zone.rawValue
    }
}
