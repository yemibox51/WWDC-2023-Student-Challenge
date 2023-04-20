import SpriteKit

class DoubleZone: SKSpriteNode, BaseballGameObjects {
    func setUp() {
        self.name = "Double"
        self.color = .green
        self.texture = SKTexture(imageNamed: "double")
        self.size  = CGSize(width: 338, height: 50)
        self.alpha = 1.0
        
        self.position = CGPoint(x: -445, y: 1355)
        self.zRotation = (CGFloat.pi/4.5)
        
        setUpPhysics()
    }
    
    private func setUpPhysics() {
//        self.physicsBody = SKPhysicsBody(rectangleOf: self.size)
        self.physicsBody = SKPhysicsBody(rectangleOf: self.size, center: self.anchorPoint)
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.mass = 115
        self.physicsBody?.pinned = true
        self.physicsBody?.isDynamic = false
        self.physicsBody?.categoryBitMask = BitMask.Zone.rawValue
    }
}

