import SwiftUI
import SpriteKit

extension GameScene {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
//        if !isPitch {
//            ball.physicsBody?.applyImpulse(CGVector(dx: 0.0, dy: ball.impulseY))
//            isPitch = true
//        }
        
//        let windUp = SKAction.rotate(toAngle: bat.windUpRotation, duration: 0.1)
//        bat.run(windUp) 
        
        if !bat.hasSwung {
            bat.hasSwung = true
//            bat.physicsBody?.applyAngularImpulse(bat.impulse)
//            let move = SKAction.move(to: CGPoint(x: 50, y: 0), duration: 0.1)
            let rotate = SKAction.applyAngularImpulse(bat.impulse, duration: 0.1)
//            let swing = SKAction.group([move, rotate])
            
            bat.run(rotate)
        }
        
        guard let touch = touches.first else { return }
        debugTouchLocation(touch)
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
}
