import SwiftUI
import SpriteKit

struct ContentView: View {
    @EnvironmentObject var gameData: GameData
    @State var gameInnings = 0
    
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
        VStack {
            BaseballScoreboard()
                .environmentObject(gameData)
            
            SpriteView(scene: gameScene)
                .scaledToFit()
                .ignoresSafeArea()
                .padding(5)
        }
        
        if gameData.innings > 3 && gameData.teamAwayScore != gameData.teamHomeScore {
            if gameData.teamAwayScore > gameData.teamHomeScore {
                NavigationLink(destination: WinView()) {
                    WinView()
                }
            } else {
                NavigationLink(destination: WinView()) {
                    LoseView()
                }
            }
        }
    }
}
