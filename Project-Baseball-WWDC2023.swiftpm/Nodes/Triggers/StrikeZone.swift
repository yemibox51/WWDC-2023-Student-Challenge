import SpriteKit

class StrikeZone: SKSpriteNode, BaseballGameObjects {
    func setUp() {
        self.name = "StrikeZone"
        self.color = .yellow
        self.size  = CGSize(width: 100, height: 25)
        self.alpha = CGFloat(1)
        let w = 1440
        self.position = CGPoint(x: (w/2), y: -100)
        
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
            
