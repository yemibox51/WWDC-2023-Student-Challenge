import SpriteKit

class StrikeZone: SKSpriteNode, BaseballGameObjects {
    var altName = "Catcher"
    func setUp() {
        self.name = "StrikeZone"
        self.color = .yellow
        self.texture = SKTexture(imageNamed: altName)
        self.size  = CGSize(width: 50, height: 80)
        self.alpha = CGFloat(1)
        self.zRotation = CGFloat.pi/2
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
            
