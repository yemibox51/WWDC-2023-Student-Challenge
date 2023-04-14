import SwiftUI
import SpriteKit

struct RocketView: View {
    var gameScene: SKScene {
        let gameScene = GameScene()
        gameScene.size = CGSize(width: 600, height: 600)
        gameScene.scaleMode = .aspectFit
        gameScene.backgroundColor = .clear
        gameScene.anchorPoint = CGPoint(x: 0, y: 0)
        
        return gameScene
    }
    
    
    var body: some View {
        VStack {
            Text("Rockets are fun")
            SpriteView(scene: gameScene)
                .scaledToFit()
                .ignoresSafeArea()
                .padding(5)
        }
    }
}
