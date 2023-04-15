import SpriteKit

class StrikeZone: SKSpriteNode, BaseballGameObjects {
    
    
    func setUp() {
        self.color = .yellow
        self.size  = CGSize(width: 100, height: 25)
        self.position = CGPoint(x: 300, y: -15)
        
        setUpPhysics()
    }
    
    private func setUpPhysics() {
        self.physicsBody = SKPhysicsBody(rectangleOf: self.size)
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.pinned = true
        self.physicsBody?.isDynamic = false
        self.physicsBody?.categoryBitMask = BitMask.StrikeZone.rawValue
    }
}
            
