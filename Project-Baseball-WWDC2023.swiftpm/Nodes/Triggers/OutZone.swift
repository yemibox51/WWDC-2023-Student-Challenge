import SpriteKit

class OutZone: SKSpriteNode, BaseballGameObjects {
    func setUp() {
        self.name = "OutZone"
        self.color = .orange
        self.size  = CGSize(width: 100, height: 25)
        self.alpha = 1.0
        let w = UIScreen.main.bounds.width
        self.position = CGPoint(x: (w/2), y: 1200)
        
        setUpPhysics()
    }
    
    private func setUpPhysics() {
        self.physicsBody = SKPhysicsBody(rectangleOf: self.size)
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.pinned = true
        self.physicsBody?.isDynamic = false
        self.physicsBody?.categoryBitMask = BitMask.Zone.rawValue
    }
}

