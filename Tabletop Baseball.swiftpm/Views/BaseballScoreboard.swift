import SwiftUI


struct BaseballScoreboard: View {
    @EnvironmentObject var gameData: GameData
    @State var count = 0
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Text("Away")
                Spacer()
                Text("Home")
            } // HStack
            .font(.headline)
            .padding(.horizontal, 20)
            
            Divider()
                .padding(.horizontal, 10)
            
            HStack {
                Text("\(gameData.teamAwayScore)")
                    .font(.system(size: 40))
                Spacer()
                Text("\(gameData.teamHomeScore)")
                    .font(.system(size: 40))
            } // HStack
            .padding(.horizontal, 20)
            
            VStack {
                HStack {
                    Text("Strikes")
                        .font(.system(size: 20))
                    ForEach(0..<gameData.strikes, id: \.self) { _ in
                        if gameData.strikes < 3 {
                            Image(systemName: "baseball.fill")
                        }
                    }
                } // HStack
                HStack {
                    Text("Outs")
                        .font(.system(size: 20))
                    ForEach(0..<gameData.outs, id: \.self) { _ in
                        if gameData.outs < 3 {
                            Image(systemName: "baseball.circle.fill")
                        }
                    }
                } // HStack
            }
            
            Divider()
                .padding(.horizontal, 10)
            
            HStack {
                Text(gameData.isTopOfInning ? "Top" : "Bot")
                    .font(.headline)
                Text("\(gameData.innings)")
                    .font(.system(size: 20))
                    .padding(.horizontal, 5)
            } // HStack
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
        } // VStack
    }
}
