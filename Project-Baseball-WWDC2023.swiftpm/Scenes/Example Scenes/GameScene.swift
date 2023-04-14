// Want to be able to pass in a color for this scene
//    var colorOfBox: UIColor
//    init(_ colorOfBox: UIColor) {
//        super.init()
//        self.colorOfBox = colorOfBox
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
import SwiftUI
import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    var rocket = SKSpriteNode()
    var rocketSize = CGSize(width: 50, height: 50)
    let rocketThrustAngularImpulse = 0.005
    var rocketXThrust = CGFloat(115)
    var rocketYThrust = CGFloat(40)
    var rocketCamera = SKCameraNode()
    
    var groundLevel = SKSpriteNode()
    var groundLevelSize = CGSize(width: 10000, height: 10)
    
    var touchLocation = CGPoint()
    
    override func didMove(to view: SKView) {
        
        physicsWorld.contactDelegate = self
        physicsWorld.gravity = CGVector(dx: 0, dy: -0.9)
        
        self.camera = rocketCamera
        
        rocket = SKSpriteNode(color: .cyan, size: rocketSize)
        rocket.position = CGPoint(x: 300, y: 100)
        rocket.name = "rocket"
        rocket.physicsBody = SKPhysicsBody(rectangleOf: rocketSize)
        rocket.physicsBody?.mass = 1
        rocket.physicsBody?.angularDamping = 1.5
        addChild(rocket)
        
        groundLevel = SKSpriteNode(color: .brown, size: groundLevelSize)
        groundLevel.position = CGPoint(x: 300, y: 10)
        groundLevel.name = "ground"
        groundLevel.physicsBody = SKPhysicsBody(rectangleOf: groundLevelSize)
        groundLevel.physicsBody?.isDynamic = false
        addChild(groundLevel)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        touchLocation = touch.location(in: self)
        fireThrustors(location: touchLocation)
    }
    
    func fireThrustors(location loc: CGPoint) {
        let adjustedRotation = rocket.zRotation + (CGFloat.pi / 2)
        let dx = rocketXThrust * cos(adjustedRotation)
        let dy = rocketYThrust * sin(adjustedRotation)
        
        if loc.x > (100 + rocket.position.x) {
            rocket.physicsBody?.applyAngularImpulse(-rocketThrustAngularImpulse)
            createThrustParticle(particleColor: .orange)
        } else if loc.x < (-100 + rocket.position.x) {
            rocket.physicsBody?.applyAngularImpulse(rocketThrustAngularImpulse)
            createThrustParticle(particleColor: .blue)
        } else {
            rocket.physicsBody?.applyImpulse(CGVector(dx: dx, dy: dy))
            createThrustParticle(particleColor: .white)
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        rocketCamera.position = rocket.position
    }
    
    func createThrustParticle(particleColor color: UIColor) {
        let thrusterParticle = SKSpriteNode(color: color, size: CGSize(width: 5, height: 5))
        thrusterParticle.position = rocket.position
        addChild(thrusterParticle)
    }
}
