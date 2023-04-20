import SwiftUI
import SpriteKit

extension GameScene {
    
    override func didMove(to view: SKView) {
        physicsWorld.contactDelegate = self
        
        let fieldColor = UIColor(red: 76.0/255.0, green: 175.0/255.0, blue: 80.0/255.0, alpha: 0.5)
        self.backgroundColor = fieldColor
        
        baseballField.position = CGPoint(x: width / 2, y: (width / 2)+90)
        baseballField.zPosition = -1.0
        // MARK: place bacground correctly
//        let screenBounds = UIScreen.main.bounds
//        let screenWidth = screenBounds.width
//        let screenHeight = screenBounds.height
//        
//        baseballField.position = CGPoint(x: screenWidth/2, y: (screenHeight/2)) 
//        baseballField.anchorPoint = CGPoint(x: 0.5, y: 0.37)
        addChild(baseballField)
        
        camera = cameraNode
//        camera?.setScale(2.0) // For placing zones
        addChild(cameraNode)
        
        // Add strike zone back
        gameObjects = [bat, 
                       ball, 
                       strikeZone,
                       foulZoneLeft,   foulZoneRight,
                       outZoneLeft,    outZoneRight,
                       singleZoneLeft, singleZoneRight,
                       doubleZoneLeft, doubleZoneRight,
                       tripleZoneLeft, tripleZoneRight, 
                       homeRunZone,
                       runner,
                       pitcher, 
                       fielder1, fielder2, fielder3, fielder4, fielder5, fielder6, fielder7]
        for gameObject in gameObjects {
            gameObject.setUp()
            addChild(gameObject as! SKNode)
        }
        flipZone()
        placeFielders()
        
        runners = [runner]
//      drawCollisions()
        
        // Default position
        self.camera?.position = ball.position
        
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        bat.resetBatPos()
        checkStatus()
        //        drawCollisions()
        if self.isBallHit {
            self.camera?.position = ball.position
        }
    }
    
    func checkStatus() {
        checkForScore()
        checkForOuts()
        checkForInnings()
        checkForEndGame()
    }
}

extension GameScene {
    private func checkForScore() {
        for (number, runner) in runners.enumerated() {
            if runner.aRun.count > 3 {
                self.teamAwayScore += 1
                removeChildren(in: [runner])
                runners.remove(at: number)
                runner.aRun = []
            }
        }
    }
    private func checkForOuts() {
        if self.strikes == 3 {
            self.outs += 1
            self.strikes = 0
        }
    }
    
    private func checkForInnings() {
        if self.outs == 3 {
            self.innings += 1
            self.teamHomeScore = Int.random(in: self.teamHomeScore...self.teamAwayScore)
            self.outs = 0
            removeRunners()
        }
    }
    private func removeRunners() {
        for runner in runners {
            removeChildren(in: [runner])
            runners = []
            
            self.runner = Runner()
            self.runner.setUp()
            addChild(self.runner)
            runners.append(self.runner)
        }
    }
    
    private func checkForEndGame() {
        if self.innings > 3 && self.teamAwayScore != self.teamHomeScore {
            let gameOver = true
        }
    }
}
