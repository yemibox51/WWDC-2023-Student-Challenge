import SpriteKit

class SingleZone: SKSpriteNode, BaseballGameObjects {
    func setUp() {
        self.name = "Single"
        self.color = .blue
        self.size = CGSize(width: 338, height: 50)
        self.texture = SKTexture(imageNamed: "single")
        self.alpha = 1.0

        self.position = CGPoint(x: -170, y: 1550)
        self.zRotation = (CGFloat.pi/6)
        
        setUpPhysics()
    }

    private func setUpPhysics() {
//        self.physicsBody = SKPhysicsBody(rectangleOf: self.size, center: self.anchorPoint)
        self.physicsBody = SKPhysicsBody(rectangleOf: self.size, center: CGPoint(x: 0.5, y: 0.5))
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.mass = 115
        self.physicsBody?.pinned = true
        self.physicsBody?.isDynamic = false
        self.physicsBody?.categoryBitMask = BitMask.Zone.rawValue
    }
}

