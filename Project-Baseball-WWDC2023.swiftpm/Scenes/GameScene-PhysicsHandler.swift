import SpriteKit

extension GameScene {
    func didBegin(_ contact: SKPhysicsContact) {
        
        let BallCategory = BitMask.Ball.rawValue
        let BatCategory  = BitMask.Bat.rawValue
        let ZoneCategory = BitMask.Zone.rawValue
        
        if contact.bodyA.categoryBitMask == BatCategory && contact.bodyB.categoryBitMask == BallCategory {
            print("Bat hit ball")
        }
        if contact.bodyA.categoryBitMask == BallCategory && contact.bodyB.categoryBitMask == ZoneCategory {
            if let zone = contact.bodyB.node?.name {
                checkCollisionFor(zone)
            }
        }
    }
    func didEnd(_ contact: SKPhysicsContact) {
//        print("Ended")
        print(umpire.getStrike())
    }
    
    private func checkCollisionFor(_ zone: String) {
        switch(zone) {
        case "OutZone":
            umpire.addOut()
        case "StrikeZone":
            umpire.addStrike()
        case "Single":
            print("Got a single")
        case "Double":
            print("Got a double")
        case "Triple":
            print("Got a triple")
        case "HomeRun":
            print("Got a home run")
        default:
            umpire.addFoul()
        }
    }
}
