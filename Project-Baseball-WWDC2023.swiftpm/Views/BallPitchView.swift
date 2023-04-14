import SwiftUI
import SpriteKit

struct BallPitchView: View {
    var ballPitchScene: SKScene {
        let gameScene = BallPitchScene2()
        gameScene.size = CGSize(width: 600, height: 600)
        gameScene.scaleMode = .fill //.aspectFit
        gameScene.backgroundColor = .clear
        gameScene.anchorPoint = CGPoint(x: 0, y: 0)
        
        return gameScene
    }
    
    var body: some View {
        VStack {
            Text("Ball pitches are fun")
            SpriteView(scene: ballPitchScene)
                .scaledToFit()
                .ignoresSafeArea()
                .padding(5)
            Text("Strike:")
        }
    }
}
