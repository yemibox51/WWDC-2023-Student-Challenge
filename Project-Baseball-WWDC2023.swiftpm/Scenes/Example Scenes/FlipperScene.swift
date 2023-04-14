import SwiftUI
import SpriteKit

class FlipperScene: SKScene, SKPhysicsContactDelegate {
    
    var flipper: SKSpriteNode!
    var flipperBase: SKSpriteNode!
    var flipperJoint: SKPhysicsJointPin!
    
    override func didMove(to view: SKView) {
        physicsWorld.contactDelegate = self
        // Create flipper base
        flipperBase = SKSpriteNode(color: .gray, size: CGSize(width: 10, height: 30))
        flipperBase.position = CGPoint(x: 100, y: 100)
        flipperBase.anchorPoint = CGPoint(x: 0.5, y: 0)
        flipperBase.physicsBody = SKPhysicsBody(rectangleOf: flipperBase.size)
        flipperBase.physicsBody?.affectedByGravity = false
        flipperBase.physicsBody?.isDynamic = true
        addChild(flipperBase)
        
        // Create flipper
        flipper = SKSpriteNode(color: .gray, size: CGSize(width: 100, height: 20))
        flipper.position = CGPoint(x: 100, y: 100)
        flipper.anchorPoint = CGPoint(x: 0.5, y: 0)
        flipper.physicsBody = SKPhysicsBody(rectangleOf: flipper.size)
        flipper.physicsBody?.affectedByGravity = false
        flipper.physicsBody?.categoryBitMask = 1
        flipper.physicsBody?.collisionBitMask = 0
        flipper.physicsBody?.contactTestBitMask = 2
        addChild(flipper)
        
        // Create joint between flipper and base
        flipperJoint = SKPhysicsJointPin.joint(withBodyA: flipper.physicsBody!, bodyB: flipperBase.physicsBody!, anchor: flipperBase.position)
        flipperJoint.frictionTorque = 5.0
        physicsWorld.add(flipperJoint)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Apply impulse to flipper
        flipper.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 150))
        print("touch")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Apply opposite impulse to flipper to bring it back down
        //flipper.physicsBody?.applyImpulse(CGVector(dx: 0, dy: -50))
    }
}
