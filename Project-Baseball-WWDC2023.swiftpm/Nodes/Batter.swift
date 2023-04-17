import SpriteKit

class Batter: SKSpriteNode, BaseballGameObjects {
    let defaultRotation = -(CGFloat.pi/3) // slightly higher than 90
    let windUpRotation = -(CGFloat.pi/2) // 90 degrees
    let impulse = CGFloat(2)
    
    var hasSwung = false
    
    func setUp() {
        self.name = "Bat"
        self.color = .red
        self.size = CGSize(width: 100, height: 25)
        let w = UIScreen.main.bounds.width
//        let h = UIScreen.main.bounds.height
        self.position = CGPoint(x: (w/2)-30, y: 100)
        self.zRotation = defaultRotation
        self.anchorPoint = CGPoint(x: 0.2, y: 0.5)
        
        setUpPhysics()
    }
    
    func resetBatPos() {
        if let batAngularVelocity = self.physicsBody?.angularVelocity {
            if self.hasSwung && batAngularVelocity < 0.1 {
                let windUp = SKAction.rotate(toAngle: self.defaultRotation, duration: 0.5)
                self.run(windUp)
                self.hasSwung = false
            }
        }
    }
    
    
    private func setUpPhysics() {
        self.physicsBody = SKPhysicsBody(rectangleOf: self.size)
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.isDynamic = true
        self.physicsBody?.allowsRotation = true
        self.physicsBody?.pinned = true
        
        self.physicsBody?.mass = CGFloat(1)
        self.physicsBody?.angularDamping = CGFloat(7)
        
        self.physicsBody?.categoryBitMask = BitMask.Bat.rawValue
    }   
}
