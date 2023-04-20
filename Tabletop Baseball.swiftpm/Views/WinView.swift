import SwiftUI

struct WinView: View {
    var body: some View {
        ZStack {
            Color(.blue)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Congratulations! You Win!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                
                Divider()
                
                
                VStack(spacing: 10) {
                    Image(systemName: "rosette")
                        .font(.system(size: 80))
                        .foregroundColor(.white)
                        .padding()
                }
                
            } // VStack
        } // ZStack
        
    }
}

