import SwiftUI
import SpriteKit

struct ContentView: View {
    @EnvironmentObject var gameData: GameData
    
    var gameScene: SKScene {
        let gameScene = GameScene(
            strikes: $gameData.strikes, 
            outs: $gameData.outs, 
            innings: $gameData.innings, 
            teamHomeScore: $gameData.teamHomeScore, 
            teamAwayScore: $gameData.teamAwayScore, 
            isTopOfInning: $gameData.isTopOfInning
        )
//        gameScene.backgroundColor = .clear
        gameScene.anchorPoint = CGPoint(x: 0, y: 0)
        
        return gameScene
    }
    
    var body: some View {
//        Text("Baseball")
//        Text("Strikes: \(gameData.strikes)")
//        Text("Outs: \(gameData.outs)")
//        Text("Innings: \(gameData.innings)")
        VStack {
            BaseballScoreboard()
                .environmentObject(gameData)
            
            SpriteView(scene: gameScene)
                .scaledToFit()
                .ignoresSafeArea()
                .padding(5)
        }
        
    }
}
