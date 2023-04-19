import SwiftUI
import SpriteKit

extension GameScene {
    func flipZone() {
        // Angle
        outZoneRight.zRotation = -(outZoneLeft.zRotation)
        singleZoneRight.zRotation = -(singleZoneLeft.zRotation)
        doubleZoneRight.zRotation = -(doubleZoneLeft.zRotation)
        tripleZoneRight.zRotation = -(tripleZoneLeft.zRotation)
        
        // Position
        outZoneRight.position = CGPoint(x: 965, y: 1757)
        singleZoneRight.position = CGPoint(x: 1613, y: 1550)
        doubleZoneRight.position = CGPoint(x: 1893, y: 1360)
        tripleZoneRight.position = CGPoint(x: 1300, y: 1690)
        
        // Remake Physics Boxes
//        reMakePhysicsBoxes()
    }
    
    func reMakePhysicsBoxes() {
        outZoneRight.physicsBody = SKPhysicsBody(rectangleOf: self.size)
        outZoneRight.physicsBody?.mass = 115
        outZoneRight.physicsBody?.affectedByGravity = false
        outZoneRight.physicsBody?.pinned = true
        outZoneRight.physicsBody?.isDynamic = false
        outZoneRight.physicsBody?.categoryBitMask = BitMask.Zone.rawValue
        
        singleZoneRight.physicsBody = SKPhysicsBody(rectangleOf: self.size)
        singleZoneRight.physicsBody?.mass = 115
        singleZoneRight.physicsBody?.affectedByGravity = false
        singleZoneRight.physicsBody?.pinned = true
        singleZoneRight.physicsBody?.isDynamic = false
        singleZoneRight.physicsBody?.categoryBitMask = BitMask.Zone.rawValue
        
        doubleZoneRight.physicsBody = SKPhysicsBody(rectangleOf: self.size)
        doubleZoneRight.physicsBody?.mass = 115
        doubleZoneRight.physicsBody?.affectedByGravity = false
        doubleZoneRight.physicsBody?.pinned = true
        doubleZoneRight.physicsBody?.isDynamic = false
        doubleZoneRight.physicsBody?.categoryBitMask = BitMask.Zone.rawValue
        
        tripleZoneRight.physicsBody = SKPhysicsBody(rectangleOf: self.size)
        tripleZoneRight.physicsBody?.mass = 115
        tripleZoneRight.physicsBody?.affectedByGravity = false
        tripleZoneRight.physicsBody?.pinned = true
        tripleZoneRight.physicsBody?.isDynamic = false
        tripleZoneRight.physicsBody?.categoryBitMask = BitMask.Zone.rawValue
    }
}
