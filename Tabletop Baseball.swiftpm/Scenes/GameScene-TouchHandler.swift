import SwiftUI
import SpriteKit

extension GameScene {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
//        if !isPitch {
//            ball.physicsBody?.applyImpulse(CGVector(dx: 0.0, dy: ball.impulseY))
//            isPitch = true
//        }
        
        let windUp = SKAction.rotate(toAngle: bat.windUpRotation, duration: 0.1)
        bat.run(windUp) 
        
        guard let touch = touches.first else { return }
        debugTouchLocation(touch)
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if !bat.hasSwung {
            bat.hasSwung = true
            let swing = SKAction.applyAngularImpulse(bat.impulse, duration: 0.1)
            bat.run(swing)
        }
    }
}
