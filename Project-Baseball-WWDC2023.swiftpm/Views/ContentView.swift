import SwiftUI
import SpriteKit

struct ContentView: View {
    var gameScene: SKScene {
        let gameScene = GameScene()
        let uiScreen = UIScreen.main.bounds
        let width = uiScreen.width //600
        let height = uiScreen.height //600
        gameScene.size = CGSize(width: width, height: height)
        gameScene.scaleMode = .aspectFit
        gameScene.backgroundColor = .clear
        gameScene.anchorPoint = CGPoint(x: 0, y: 0)
        
        return gameScene
    }
    
    var body: some View {
        VStack {
            Text("Baseball")
            SpriteView(scene: gameScene)
//                .scaledToFit()
                .ignoresSafeArea()
                .padding(5)
        }
    }
}
