import SpriteKit

class OutZone: SKSpriteNode, BaseballGameObjects {
    func setUp() {
        self.name = "OutZone"
        self.color = .red
        self.size  = CGSize(width: 338, height: 50)
        self.alpha = 1.0
        
        self.position = CGPoint(x:475, y: 1760)
        self.zRotation = (CGFloat.pi/30)
        
        setUpPhysics()
    }
    
    private func setUpPhysics() {
        self.physicsBody = SKPhysicsBody(rectangleOf: self.size, center: self.anchorPoint)
        self.physicsBody?.mass = 115
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.pinned = true
        self.physicsBody?.isDynamic = false
        self.physicsBody?.categoryBitMask = BitMask.Zone.rawValue
    }
}

