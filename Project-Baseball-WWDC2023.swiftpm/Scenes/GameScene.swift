import SwiftUI
import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    let width = 1440
    var bat = Batter()
    var ball = Ball()
    
    var strikeZone = StrikeZone()
    var homeRunZone = HomeRunZone()
    
    var outZoneLeft = OutZone()
    var outZoneRight = OutZone()
    var singleZoneLeft = SingleZone()
    var singleZoneRight = SingleZone()
    var doubleZoneLeft = DoubleZone()
    var doubleZoneRight = DoubleZone()
    var tripleZoneLeft = TripleZone()
    var tripleZoneRight = TripleZone()
    
    var baseballField = SKSpriteNode(imageNamed: "field_practice")
    
    var cameraNode = SKCameraNode()
    var label = SKLabelNode()
    
    var umpire = Umpire()
    var gameObjects: [BaseballGameObjects] = []
    var zoneObjects: [BaseballGameObjects] = []
    
    var isPitch = false // Attach to an object
    
    override func didMove(to view: SKView) {
        physicsWorld.contactDelegate = self
        
        baseballField.position = CGPoint(x: width / 2, y: (width / 2)+90)
        baseballField.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        addChild(baseballField)
        
        camera = cameraNode
        camera?.setScale(2.0) // For placing zones
        addChild(cameraNode)
        
        // Add strike zone back
        gameObjects = [bat, ball, outZoneLeft, singleZoneLeft, doubleZoneLeft, tripleZoneLeft, outZoneRight, singleZoneRight, doubleZoneRight, tripleZoneRight, homeRunZone]
        for gameObject in gameObjects {
            gameObject.setUp()
            addChild(gameObject as! SKNode)
        }
        flipZone()
//        drawCollisions()
        
//        let label = SKLabelNode(text: "Label Text") // create the label node
//        label.fontSize = 600
//        label.fontColor = .white
//        
//        label.position = CGPoint(x: 0, y: 1500)
//        addChild(label)
        
        // Default position
        self.camera?.position = ball.position
        
        let wait = SKAction.wait(forDuration: 5.0)
        let run = SKAction.run {
            self.ball.physicsBody?.applyImpulse(CGVector(dx: 0.0, dy: self.ball.impulseY))
        }
        
        let sequence = SKAction.sequence([wait, run])
        let repeatAction = SKAction.repeatForever(sequence)
        
        // Run the action on a node in your scene
        ball.run(repeatAction)
    }
    
    override func update(_ currentTime: TimeInterval) {
        bat.resetBatPos()
        umpire.checkStatus()
//        drawCollisions()
    }
   
}
