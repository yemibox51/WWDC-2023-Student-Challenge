import SpriteKit

class Batter: SKSpriteNode, BaseballGameObjects {
    let defaultRotation = (7*CGFloat.pi/6)
    let windUpRotation = -(CGFloat.pi/2) // 90 degrees
    let impulse = CGFloat(2)
    
    var hasSwung = false
    
    func setUp() {
        self.name = "Bat"
        self.color = .red
        self.texture = SKTexture(imageNamed: "new_bat_wood")
        self.size = CGSize(width: 270, height: 28)
        let w = UIScreen.main.bounds.width
        self.position = CGPoint(x: (w/2)-100, y: 0)
        self.zRotation = defaultRotation
//        self.anchorPoint = CGPoint(x: 0.2, y: 0.5)
        
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
        let texture = SKTexture(imageNamed: "new_bat_wood")
        self.physicsBody = SKPhysicsBody(texture: texture, alphaThreshold: 0.5, size: self.size)
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.isDynamic = true
        self.physicsBody?.allowsRotation = true
        self.physicsBody?.pinned = true
        
        self.physicsBody?.mass = CGFloat(1)
        self.physicsBody?.angularDamping = CGFloat(7)
        
        self.physicsBody?.categoryBitMask = BitMask.Bat.rawValue
    }   
}
