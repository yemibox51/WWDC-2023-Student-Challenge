import SpriteKit

class DoubleZone: SKSpriteNode, BaseballGameObjects {
    func setUp() {
        self.name = "Double"
        self.color = .blue
        self.size  = CGSize(width: 100, height: 25)
        self.alpha = 1.0
        let w = UIScreen.main.bounds.width
        self.position = CGPoint(x: (w/2)-500, y: 1000)
        
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

