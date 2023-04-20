import SwiftUI
import SpriteKit

extension GameScene {
    func placeFielders() {
        fielder1.position = CGPoint(x: 1125.0, y: 504.0)
        fielder1.zRotation = -(5*CGFloat.pi/7)
        
        fielder2.position = CGPoint(x: 807.0, y: 870.0)
        fielder2.zRotation = -(CGFloat.pi/2)
        
        fielder3.position = CGPoint(x: 318.0, y: 529.0)
        fielder3.zRotation = -(CGFloat.pi/5)
        
        fielder4.position = CGPoint(x: 545.0, y: 785.0)
        fielder4.zRotation = -(CGFloat.pi/2)
        
        fielder5.position = CGPoint(x: 1322.0, y: 1306.0)
        fielder5.zRotation = -(5*CGFloat.pi/7)
        
        fielder6.position = CGPoint(x: 658.0, y: 1535.0) //CGPoint(x: 812.0, y: 1532.0)
        fielder6.zRotation = -(CGFloat.pi/2)
        
        fielder7.position = CGPoint(x: 68.0, y: 1301.0)
        fielder7.zRotation = -(CGFloat.pi/3)
    }
}
