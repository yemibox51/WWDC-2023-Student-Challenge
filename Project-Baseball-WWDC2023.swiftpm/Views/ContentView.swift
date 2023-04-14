import SwiftUI
import SpriteKit

struct ContentView: View {
    var gameScene: SKScene {
//        let gameScene = GameScene()
        let gameScene = FlipperScene()
        gameScene.size = CGSize(width: 600, height: 600)
        gameScene.scaleMode = .aspectFit
        gameScene.backgroundColor = .clear
        gameScene.anchorPoint = CGPoint(x: 0, y: 0)
        
        return gameScene
    }
    
    var altGameScene: SKScene {
        let gameScene = BatSwingScene()
        gameScene.size = CGSize(width: 600, height: 600)
        gameScene.scaleMode = .aspectFit
        gameScene.backgroundColor = .clear
        gameScene.anchorPoint = CGPoint(x: 0, y: 0)
        
        return gameScene
    }
    
    var body: some View {
        VStack {
            Text("Bat swings are fun")
            SpriteView(scene: altGameScene)
                .scaledToFit()
                .ignoresSafeArea()
                .padding(5)
        }
    }
}
