import SwiftUI
import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    var bat = Batter()
    var ball = Ball()
    
    var strikeZone = StrikeZone()
    var outZone = OutZone()
    var singleZone = SingleZone()
    var doubleZone = DoubleZone()
    var tripleZone = TripleZone()
    var homeRunZone = HomeRunZone()
    
    var umpire = Umpire()
    var gameObjects: [BaseballGameObjects] = []
    
    var isPitch = false // Attach to an object
    
    override func didMove(to view: SKView) {
        physicsWorld.contactDelegate = self
        
        gameObjects = [bat, ball, strikeZone, outZone, singleZone, doubleZone, tripleZone, homeRunZone]
        for gameObject in gameObjects {
            gameObject.setUp()
            addChild(gameObject as! SKNode)
        }
        
    }
    
    override func update(_ currentTime: TimeInterval) {
//        if (ball.position.x < 10 || ball.position.x > 600) || (ball.position.y > 800) {
//            resetGame()
//        }
        bat.resetBatPos()
        umpire.checkStatus()
    }
   
}
