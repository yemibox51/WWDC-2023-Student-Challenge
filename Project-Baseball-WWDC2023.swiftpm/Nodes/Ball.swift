import SpriteKit

class Ball: SKSpriteNode, BaseballGameObjects {
    let defaultPosition = CGPoint(x: 300, y: 600)
    let impulseY = CGFloat(-50)//CGFloat(-300)
    
    
    
    func setUp() {
        self.name = "Ball"
        self.color = .blue
        self.texture = SKTexture(imageNamed: "ball_generic1")
        self.size = CGSize(width: 25, height: 25)
        let w = UIScreen.main.bounds.width
        let h = UIScreen.main.bounds.height
        self.position = CGPoint(x: w/2, y: h/2)
        
        setUpPhysics()
    }
    
    private func setUpPhysics() {
        self.physicsBody = SKPhysicsBody(rectangleOf: self.size)
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.mass = CGFloat(0.1)
        self.physicsBody?.linearDamping = CGFloat(0.05)
        self.physicsBody?.categoryBitMask = BitMask.Ball.rawValue
        
        let BatCategory = BitMask.Bat.rawValue
        let ZoneCategory  = BitMask.Zone.rawValue
        self.physicsBody?.contactTestBitMask = BatCategory | ZoneCategory
    }
    
//     func pitch() {
////        let wait = SKAction.wait(forDuration: 5.0)
////        let run = SKAction.run {
////             ball.physicsBody?.applyImpulse(CGVector(dx: 0.0, dy: ball.impulseY))
////        }
//    }
    
}
