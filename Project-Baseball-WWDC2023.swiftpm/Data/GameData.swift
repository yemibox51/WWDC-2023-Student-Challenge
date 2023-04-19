import SwiftUI

class GameData: ObservableObject {
    @Published var strikes: Int = 0
    @Published var outs: Int = 0
    
}
