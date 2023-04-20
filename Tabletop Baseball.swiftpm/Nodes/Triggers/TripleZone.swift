import SpriteKit

class TripleZone: SKSpriteNode, BaseballGameObjects {
    func setUp() {
        self.name = "Triple"
        self.color = .yellow
        self.size  = CGSize(width: 338, height: 50)
        self.texture = SKTexture(imageNamed: "triple")
        self.alpha = 1.0
        
        self.position = CGPoint(x: 140, y: 1690)
        self.zRotation = (CGFloat.pi/10.5)
        
        setUpPhysics()
    }
    
    private func setUpPhysics() {
        self.physicsBody = SKPhysicsBody(rectangleOf: self.size, center: self.anchorPoint)
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.mass = 115
        self.physicsBody?.pinned = true
        self.physicsBody?.isDynamic = true
        self.physicsBody?.categoryBitMask = BitMask.Zone.rawValue
    }
}

