import SwiftUI

struct HowToPlayView: View {
    @State private var showNextView = false
    var body: some View {
        ZStack {
            Color(red: 76.0/255.0, green: 175.0/255.0, blue: 80.0/255.0)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Image(systemName: "baseball.fill")
                        .font(.largeTitle)
                    Text("Tabletop Baseball")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                    Image(systemName: "figure.baseball")
                        .font(.largeTitle)
                }
                
                
                Divider()
                
                
                VStack(spacing: 10) {
                    Text("How to Play")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                    Text("Tap and hold to windup the bat.")
                        .foregroundColor(.white)
                    Text("When you are ready to swing, release.")
                        .foregroundColor(.white)
                }
                
                Divider()
                
                VStack(spacing: 10) {
                    Text("How to Win")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                    Text("There are a total of 3 Innings.")
                        .foregroundColor(.white)
                    Text("Only the top half of the innnings will be played. The bottom half will be simulated.")
                        .foregroundColor(.white)
                    Text("After the three innings, and there is no tie, a winner will be decided.")
                        .foregroundColor(.white)
                }
                
                
                Divider()
                
                VStack(spacing: 10) {
                    Text("How to Score")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                    Text("A player gets 3 outs before an inning half is over.")
                        .foregroundColor(.white)
                    Text("In that, you want to hit the ball to run as many runners as possible around the diamond.")
                        .foregroundColor(.white)
                    Text("If a runner successfully visits each plate and returns home, a point is awarded.")
                        .foregroundColor(.white)
                }
                
                VStack(spacing: 10) {
                    Text("Extra Rules")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                    Text("If the ball touches a fielder, it counts as an out")
                        .foregroundColor(.white)
                    Text("Balls hit outside the box are foul balls and will be counted as strikes until strike #2")
                        .foregroundColor(.white)
                }
                
                Button(action: {
                    // handle tap action here
                    self.showNextView = true
                }) {
                    Text("Play Ball")
                        .font(.title)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            } // VStack
        } // ZStack
        .fullScreenCover(isPresented: $showNextView, content: {
            // Next view goes here
            ContentView()
                .environmentObject(GameData())
        })
        
    }
}
