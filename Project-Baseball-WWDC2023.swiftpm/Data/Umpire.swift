import SwiftUI
// If you have time make an inning data structure
//enum halves {
//    case top
//    case bottom
//}
//struct Innings {
//    var id = 1
//    var half = 
//}

class Umpire {
    private var strikes = 0
    private var balls = 0
    private var outs = 0
    private var innings = 1 // Odd denote top half, Even denote bottom half
    private var maxGameInnings = 6
    private var teamHomeScore = 0
    private var teamAwayScore = 0
    
    func checkStatus() {
        checkForOuts()
        checkForInnings()
        checkForEndGame()
    }
}

extension Umpire {
    func addStrike() {
        self.strikes += 1
    }
    func addOut() {
        self.outs += 1
    }
    func changeInning() {
        self.innings += 1
    }
    
    func getStrike() -> Int {
        return self.strikes
    }
    
    func getOut() -> Int {
        return self.outs
    }
    
    func getInning() -> Int {
        return self.innings
    }
    
}

extension Umpire {
    private func checkForOuts() {
        if self.strikes == 3 {
            self.outs += 1
            self.strikes = 0
        }
    }
    
    private func checkForInnings() {
        if self.outs == 3 {
            self.innings += 1
            self.outs = 0
        }
    }
    
    private func checkForEndGame() {
        if self.innings > maxGameInnings {
            print("Game Over")
        }
    }
}
