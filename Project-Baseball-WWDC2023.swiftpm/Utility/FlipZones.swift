import SwiftUI
import SpriteKit

extension GameScene {
    func flipZone() {
        // Angle
        foulZoneRight.zRotation = -(foulZoneLeft.zRotation)
        outZoneRight.zRotation = -(outZoneLeft.zRotation)
        singleZoneRight.zRotation = -(singleZoneLeft.zRotation)
        doubleZoneRight.zRotation = -(doubleZoneLeft.zRotation)
        tripleZoneRight.zRotation = -(tripleZoneLeft.zRotation)
        
        // Position
        foulZoneLeft.position = CGPoint(x: 1550, y: 565)
        outZoneRight.position = CGPoint(x: 965, y: 1757)
        singleZoneRight.position = CGPoint(x: 1613, y: 1550)
        doubleZoneRight.position = CGPoint(x: 1893, y: 1360)
        tripleZoneRight.position = CGPoint(x: 1300, y: 1690)
        
    }
}
