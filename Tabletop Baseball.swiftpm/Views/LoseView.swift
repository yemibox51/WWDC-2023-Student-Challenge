import SwiftUI

struct LoseView: View {
    var body: some View {
        ZStack {
            Color(.red)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Sorry! Don't worry you will get 'em next time")
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
