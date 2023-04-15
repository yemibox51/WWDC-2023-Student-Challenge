import SwiftUI

extension GameScene {
    // Mark: Debugging functions
    func debugTouchLocation(_ touch: UITouch) {
        let touchLocation = touch.location(in: self)
        print("X: \(touchLocation.x)\nY: \(touchLocation.y)")
    }
}
