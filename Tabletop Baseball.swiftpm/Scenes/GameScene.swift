import SwiftUI
import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    let width = 1440
    var bat = Bat()
    var ball = Ball()
    var isBallHit = false
    
    var strikeZone = StrikeZone()
    var homeRunZone = HomeRunZone()
    
    var foulZoneLeft = FoulZone()
    var foulZoneRight = FoulZone()
    var outZoneLeft = OutZone()
    var outZoneRight = OutZone()
    var singleZoneLeft = SingleZone()
    var singleZoneRight = SingleZone()
    var doubleZoneLeft = DoubleZone()
    var doubleZoneRight = DoubleZone()
    var tripleZoneLeft = TripleZone()
    var tripleZoneRight = TripleZone()
    var gameObjects: [BaseballGameObjects] = []
    var zoneObjects: [BaseballGameObjects] = []
    
    var runner = Runner()
    var runners: [Runner] = []
    
    var pitcher = Pitcher()
    var fielder1 = Fielder()
    var fielder2 = Fielder()
    var fielder3 = Fielder()
    var fielder4 = Fielder()
    var fielder5 = Fielder()
    var fielder6 = Fielder()
    var fielder7 = Fielder()
    
    var homePlate = CGPoint(x: 721, y: 1)
    var firstBase = CGPoint(x: 1150, y: 416)
    var secondBase = CGPoint(x: 721, y: 850)
    var thirdBase = CGPoint(x: 286, y: 415)
    
    var baseballField = SKSpriteNode(imageNamed: "field_practice")
    
    var cameraNode = SKCameraNode()
    var label = SKLabelNode()
    
    var isPitch = false // Attach to an object
    
    @Binding var strikes: Int 
    @Binding var outs: Int
    @Binding var innings: Int 
    @Binding var teamHomeScore: Int
    @Binding var teamAwayScore: Int
    @Binding var isTopOfInning: Bool
    
    init(strikes: Binding<Int>, outs: Binding<Int>, innings: Binding<Int>, teamHomeScore: Binding<Int>, teamAwayScore: Binding<Int>, isTopOfInning: Binding<Bool>) {
        _strikes = strikes
        _outs = outs
        _innings = innings
        _teamHomeScore = teamHomeScore
        _teamAwayScore = teamAwayScore
        _isTopOfInning = isTopOfInning
        
        super.init(size: CGSize(width: width, height: width))
        self.scaleMode = .aspectFit

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
}
