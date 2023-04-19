import SwiftUI
import SpriteKit

struct ContentView: View {
    var gameScene: SKScene {
        let gameScene = GameScene()
        let width = 1440
        gameScene.size = CGSize(width: width, height: width)
        gameScene.scaleMode = .aspectFit
//        gameScene.backgroundColor = .clear
        gameScene.anchorPoint = CGPoint(x: 0, y: 0)
        
        return gameScene
    }
    
    var body: some View {
        Text("Baseball")
        SpriteView(scene: gameScene)
            .scaledToFit()
            .ignoresSafeArea()
            .padding(5)
    }
}
