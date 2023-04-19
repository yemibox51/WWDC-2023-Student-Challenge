import SpriteKit

class HomeRunZone: SKSpriteNode, BaseballGameObjects {
    func setUp() {
        self.name = "HomeRun"
        self.color = .purple
        self.size  = CGSize(width: 160, height: 50)
        self.alpha = 1.0
        let w = UIScreen.main.bounds.width
        
        self.position = CGPoint(x: (w/2), y: 1775)
        
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

