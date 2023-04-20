import SpriteKit

extension GameScene {
    func didBegin(_ contact: SKPhysicsContact) {
        
        let BallCategory = BitMask.Ball.rawValue
        let BatCategory  = BitMask.Bat.rawValue
        let ZoneCategory = BitMask.Zone.rawValue
        
        // MARK: Ball - Bat
        if contact.bodyA.categoryBitMask == BallCategory && contact.bodyB.categoryBitMask == BatCategory {
            self.isBallHit = true
        } else if contact.bodyA.categoryBitMask == BatCategory && contact.bodyB.categoryBitMask == BallCategory {
            self.isBallHit = true
        }
        
        // MARK: Ball - Zones
        if contact.bodyA.categoryBitMask == BallCategory && contact.bodyB.categoryBitMask == ZoneCategory {
            if let zone = contact.bodyB.node?.name {
                if !ball.isHitZone {
                    checkCollisionFor(zone)
                    ball.isHitZone = true
                }
            }
        } else if contact.bodyA.categoryBitMask == ZoneCategory && contact.bodyB.categoryBitMask == BallCategory {
            if let zone = contact.bodyA.node?.name {
                if !ball.isHitZone {
                    checkCollisionFor(zone)
                    ball.isHitZone = true
                }
            }
        }
    }
    func didEnd(_ contact: SKPhysicsContact) {

    }
    
    private func checkCollisionFor(_ zone: String) {
        switch(zone) {
        case "OutZone":
            self.outs += 1
        case "StrikeZone":
            self.strikes += 1
        case "Single":
            advanceRunners(1)
            print("Got a single")
        case "Double":
            advanceRunners(2)
            print("Got a double")
        case "Triple":
            advanceRunners(3)
            print("Got a triple")
        case "HomeRun":
            advanceRunners(4)
            print("Got a home run")
        default:
            if self.strikes < 2 {
                self.strikes += 1
            }
        }
        resetPitch()
    }
    private func advanceRunners(_ plates: Int) {
        for runner in runners {
            runner.advance(plates)
        }
        let runner = Runner()
        runner.setUp()
        runners.append(runner)
        addChild(runner)
    }
    
    private func resetPitch() {
        let wait = SKAction.wait(forDuration: 1)
        let getNewBall = SKAction.run {
            self.ball.removeFromParent()
            self.ball = Ball()
            self.ball.setUp()
            self.addChild(self.ball)
            self.pitcher.pitch()
            self.isBallHit = false
            self.camera?.position = self.ball.position
        }
        
        let newBall = SKAction.sequence([wait, getNewBall])
        
        ball.run(newBall)
        
    }
}
