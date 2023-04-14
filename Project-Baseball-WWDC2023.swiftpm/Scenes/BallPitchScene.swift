import SwiftUI
import SpriteKit

class BallPitchScene: SKScene, SKPhysicsContactDelegate {
    
    var bat = SKSpriteNode()
    let originalBatRot = -(CGFloat.pi/2)
    var isSwing = false
    
    var ball = SKSpriteNode()
    let originalBallPos = CGPoint(x: 300, y: 600)
    var isPitch = false
    
    override func didMove(to view: SKView) {
        createPhysicsWorld()
        bat = SKSpriteNode(
            color: .red, 
            size: CGSize(width: 100, height: 25)
        )
        bat.position = CGPoint(x: 260, y: 100)
        bat.zRotation = -(CGFloat.pi/2)
        bat.anchorPoint = CGPoint(x: 0.2, y: 0.5)
        bat.physicsBody = SKPhysicsBody(rectangleOf: bat.size)
        bat.physicsBody?.affectedByGravity = false
        bat.physicsBody?.isDynamic = true
        bat.physicsBody?.allowsRotation = true
        bat.physicsBody?.pinned = true
        bat.physicsBody?.mass = CGFloat(0.465)
        addChild(bat)
        
        ball = SKSpriteNode(
            color: .blue, 
            size: CGSize(width: 25, height: 25)
        )
        ball.position = CGPoint(x: 300, y: 600)
        ball.physicsBody = SKPhysicsBody(rectangleOf: ball.size)
        ball.physicsBody?.affectedByGravity = false
        ball.physicsBody?.mass = CGFloat(0.145)
        addChild(ball)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
//        if !isPitch {
//            let pitch = SKAction.applyImpulse(CGVector(dx: 0.0, dy: -10), duration: 0.2)
//            ball.run(pitch)
//            isPitch = true
//        }
        
        if !isPitch {
            ball.physicsBody?.applyImpulse(CGVector(dx: 0.0, dy: -250))
            isPitch = true
        }
        
        guard let touch = touches.first else { return }
        let touchLocation = touch.location(in: self)
        print("X: \(touchLocation.x)\nY: \(touchLocation.y)")
     
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        let resetBat = SKAction.rotate(byAngle: -CGFloat.pi, duration: 0.2)
//        resetBat.timingMode = .easeInEaseOut
//        bat.run(resetBat) 
//        if let velocity = ball.physicsBody?.velocity {
//            print(velocity)
//        }
        
        if !isSwing {
            isSwing = true
            bat.physicsBody?.applyAngularImpulse(0.5)
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
//        let pastHeight: () -> Bool =  { [self] in 
//           self.ball.position.y < 10 || self.ball.position.y > 800
//        }
//        let pastWidth: () -> Bool = { [self] in
//            self.ball.position.x < 10 || self.ball.position.x > 600
//        }
        if (ball.position.x < 10 || ball.position.x > 600) || (ball.position.y < 10 || ball.position.y > 800) {
            resetGame()
        }
    }
    
    func createPhysicsWorld() {
        physicsWorld.contactDelegate = self
    }
    
    func resetGame() {
        ball.position = originalBallPos
        ball.physicsBody?.velocity = CGVector(dx: 0.0, dy: 0.0)
        isPitch = false
        
        bat.zRotation = originalBatRot
        bat.physicsBody?.angularVelocity = CGFloat(0)
        isSwing = false
        
        print("Game Reset")
    }
}
