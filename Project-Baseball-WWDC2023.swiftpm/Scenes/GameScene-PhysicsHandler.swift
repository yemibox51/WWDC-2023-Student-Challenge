import SpriteKit

extension GameScene {
    func didBegin(_ contact: SKPhysicsContact) {
        
        let BallCategory = BitMask.Ball.rawValue
        let BatCategory  = BitMask.Bat.rawValue
        let StrikeZoneCategory = BitMask.StrikeZone.rawValue
        
        if contact.bodyA.categoryBitMask == BatCategory && contact.bodyB.categoryBitMask == BallCategory {
            print("Bat hit ball")
        }
        if contact.bodyA.categoryBitMask == BallCategory && contact.bodyB.categoryBitMask == StrikeZoneCategory {
            print("STRIKE")
            umpire.addStrike()
        }
    }
    func didEnd(_ contact: SKPhysicsContact) {
        print("Ended")
    }
}
