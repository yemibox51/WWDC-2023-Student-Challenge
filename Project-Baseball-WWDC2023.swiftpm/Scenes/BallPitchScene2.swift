import SwiftUI
import SpriteKit

class BallPitchScene2: SKScene, SKPhysicsContactDelegate {
    public var strikes = 0
    var bat = SKSpriteNode()
    let originalBatRot = -(CGFloat.pi/3)
    let windUpRot = -(CGFloat.pi/2)
    var isSwing = false
    
    var ball = SKSpriteNode()
    let originalBallPos = CGPoint(x: 300, y: 600)
    var isPitch = false
    
    var strikeZone = SKSpriteNode()
    
    // Impulses
    var batImpulse   = CGFloat(2)
    var ballImpulseY = CGFloat(-300)
    
    // Collision Bit masks
    let BallCategory  : UInt32 = 0x1 << 0
    let BatCategory   : UInt32 = 0x1 << 1
    let StrikeZoneCa  : UInt32 = 0x1 << 2
    
    override func didMove(to view: SKView) {
//        createPhysicsWorld()
        physicsWorld.contactDelegate = self
        bat = SKSpriteNode(
            color: .red, 
            size: CGSize(width: 100, height: 25)
        )
        bat.position = CGPoint(x: 260, y: 100)
        bat.zRotation = originalBatRot
        bat.anchorPoint = CGPoint(x: 0.2, y: 0.5)
        
        bat.physicsBody = SKPhysicsBody(rectangleOf: bat.size)
        bat.physicsBody?.affectedByGravity = false
        bat.physicsBody?.isDynamic = true
        bat.physicsBody?.allowsRotation = true
        bat.physicsBody?.pinned = true

        bat.physicsBody?.mass = CGFloat(1)
        bat.physicsBody?.angularDamping = CGFloat(7)
        
        bat.physicsBody?.categoryBitMask = BatCategory
        addChild(bat)
        
        ball = SKSpriteNode(
            color: .blue, 
            size: CGSize(width: 25, height: 25)
        )
        ball.position = CGPoint(x: 300, y: 600)
        ball.physicsBody = SKPhysicsBody(rectangleOf: ball.size)
        ball.physicsBody?.affectedByGravity = false
        ball.physicsBody?.mass = CGFloat(0.1)
        ball.physicsBody?.linearDamping = CGFloat(0.01)
        
        ball.physicsBody?.categoryBitMask    = BallCategory
        ball.physicsBody?.contactTestBitMask = BatCategory | StrikeZoneCa
        addChild(ball)
        
        strikeZone = SKSpriteNode(
            color: .yellow,
            size: CGSize(width: 100, height: 25)
        )
        strikeZone.position = CGPoint(x: 300, y: 0)
//        strikeZone.physicsBody = SKPhysicsBody(edgeLoopFrom: <#T##CGRect#>)
        strikeZone.physicsBody = SKPhysicsBody(rectangleOf: strikeZone.size)
        strikeZone.physicsBody?.affectedByGravity = false
        strikeZone.physicsBody?.pinned = true
        strikeZone.physicsBody?.isDynamic = false
        strikeZone.physicsBody?.categoryBitMask = StrikeZoneCa
        addChild(strikeZone)
    }
    
    override func update(_ currentTime: TimeInterval) {
        if (ball.position.x < 10 || ball.position.x > 600) || (ball.position.y > 800) {
            resetGame()
        }
        resetBatPos()
    }
}

extension BallPitchScene2 {
    // MARK: Touch Events
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if !isPitch {
            ball.physicsBody?.applyImpulse(CGVector(dx: 0.0, dy: ballImpulseY))
            isPitch = true
        }
        
        let windUp = SKAction.rotate(toAngle: windUpRot, duration: 0.1)
        bat.run(windUp) 
        
//        guard let touch = touches.first else { return }
//        debugTouchLocation(touch)
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if !isSwing {
            isSwing = true
            bat.physicsBody?.applyAngularImpulse(batImpulse)
        }
    }
    
}

extension BallPitchScene2 {
    func didBegin(_ contact: SKPhysicsContact) {
        if contact.bodyA.categoryBitMask == BatCategory && contact.bodyB.categoryBitMask == BallCategory {
            print("Bat hit ball")
        }
        if contact.bodyA.categoryBitMask == BallCategory && contact.bodyB.categoryBitMask == StrikeZoneCa {
            print("STRIKE")
        }
    }
    func didEnd(_ contact: SKPhysicsContact) {
        print("Ended")
    }
}

extension BallPitchScene2 {
    // MARK: Custom Functions (World)
//    func createPhysicsWorld() {
//        physicsWorld.contactDelegate = self
//    }
    
    func resetGame() {
        ball.position = originalBallPos
        ball.physicsBody?.velocity = CGVector(dx: 0.0, dy: 0.0)
        ball.zRotation = 0
        isPitch = false
        
        bat.zRotation = originalBatRot
        bat.physicsBody?.angularVelocity = CGFloat(0)
        isSwing = false
    }
}

extension BallPitchScene2 {
    // MARK: Bat functions
    func resetBatPos() {
        if let batAngularVelocity = bat.physicsBody?.angularVelocity {
            if isSwing && batAngularVelocity < 0.1 {
                let windUp = SKAction.rotate(toAngle: originalBatRot, duration: 0.5)
                bat.run(windUp)
                isSwing = false
            }
        }
    }
    
}

extension BallPitchScene2 {
    // Mark: Debugging functions
    func debugTouchLocation(_ touch: UITouch) {
        let touchLocation = touch.location(in: self)
        print("X: \(touchLocation.x)\nY: \(touchLocation.y)")
    }
}
