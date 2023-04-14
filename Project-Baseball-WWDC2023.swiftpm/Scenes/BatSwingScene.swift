import SwiftUI
import SpriteKit

class BatSwingScene: SKScene, SKPhysicsContactDelegate {
    
    var bat = SKSpriteNode()
    var batSize = CGSize(width: 100, height: 25)
    var batDefualtRotation = 0.0
    var didSwing = false
    
    override func didMove(to view: SKView) {
        createPhysicsWorld()
        bat = SKSpriteNode(color: .red, size: batSize)
        bat.position = CGPoint(x: 300, y: 100)
        bat.anchorPoint = CGPoint(x: 0.2, y: 0.5)
        bat.zRotation = -(CGFloat.pi/2)
        bat.physicsBody = SKPhysicsBody(rectangleOf: batSize)
        bat.physicsBody?.affectedByGravity = false
        addChild(bat)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        didSwing = true
        let swing = SKAction.rotate(byAngle: CGFloat.pi, duration: 0.08)
        bat.run(swing)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let resetBat = SKAction.rotate(byAngle: -CGFloat.pi, duration: 0.2)
        resetBat.timingMode = .easeInEaseOut
        bat.run(resetBat)
    }
    
    func createPhysicsWorld() {
        physicsWorld.contactDelegate = self
    }
}
