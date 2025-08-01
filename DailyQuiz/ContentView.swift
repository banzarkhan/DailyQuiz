import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
                .font(.interBold24)
            
            Button("FFFF") {
                
            }
            .mainButtonStyle(state: .startAgain)
            
            QuizOptionButton(text: "Option 1", state: .correct, action: {})
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
