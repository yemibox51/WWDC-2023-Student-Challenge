import SwiftUI

class GameData: ObservableObject {
    @Published var strikes = 0
    @Published var outs = 0
    @Published var innings = 1 
    @Published var teamHomeScore = 0
    @Published var teamAwayScore = 0
    @Published var isTopOfInning = true
}
