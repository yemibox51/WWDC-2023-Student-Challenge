import SwiftUI
import SpriteKit

extension GameScene {
    // Mark: Debugging functions
    func debugTouchLocation(_ touch: UITouch) {
        let touchLocation = touch.location(in: self)
        print("X: \(touchLocation.x)\nY: \(touchLocation.y)")
    }
    
    func drawCollisions() {
        gameObjects = [bat, ball, outZoneLeft, singleZoneLeft, doubleZoneLeft, tripleZoneLeft, outZoneRight, singleZoneRight, doubleZoneRight, tripleZoneRight, homeRunZone]
        for gameObject in gameObjects {
            let boxNode = gameObject as! SKSpriteNode
//            let physicsBody = SKPhysicsBody(rectangleOf: boxNode.size, center: boxNode.anchorPoint) // create the physics body
//            boxNode.physicsBody = physicsBody // assign the physics body to the box node
            
            let shapeNode = SKShapeNode(rectOf: boxNode.size) // create a shape node that matches the size of the box node
            shapeNode.strokeColor = .green // set the stroke color to green
            shapeNode.lineWidth = 5 // set the line width to 2 points
            shapeNode.position = boxNode.position // set the position of the shape node to match the position of the box node
            shapeNode.zRotation = boxNode.zRotation
            addChild(shapeNode) // add the shape node to the scene
        }
       
    }
}
