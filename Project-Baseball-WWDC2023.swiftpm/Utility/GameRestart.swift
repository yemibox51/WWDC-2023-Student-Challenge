import SwiftUI

extension GameScene {
    
    func resetGame() {
        ball.position = ball.defaultPosition
        ball.physicsBody?.velocity = CGVector(dx: 0.0, dy: 0.0)
        ball.zRotation = 0
        isPitch = false
        
        bat.zRotation = bat.defaultRotation
        bat.physicsBody?.angularVelocity = CGFloat(0)
        bat.hasSwung = false
    }
}
