import SpriteKit

class Ball: SKSpriteNode, BaseballGameObjects {
    let defaultPosition = CGPoint(x: 300, y: 600)
    let impulseY = CGFloat(-300)
    
    func setUp() {
        self.color = .blue
        self.size = CGSize(width: 25, height: 25)
        self.position = CGPoint(x: 300, y: 600)
        
        setUpPhysics()
    }
    
    private func setUpPhysics() {
        self.physicsBody = SKPhysicsBody(rectangleOf: self.size)
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.mass = CGFloat(0.1)
        self.physicsBody?.linearDamping = CGFloat(0.01)
        self.physicsBody?.categoryBitMask = BitMask.Ball.rawValue
        
        let BatCategory = BitMask.Bat.rawValue
        let StrikeZone  = BitMask.StrikeZone.rawValue
        self.physicsBody?.contactTestBitMask = BatCategory | StrikeZone
    }
    
}
