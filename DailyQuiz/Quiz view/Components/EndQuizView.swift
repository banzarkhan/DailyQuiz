import SwiftUI

struct EndQuizView: View {
    var quiz = Quiz(result: 3)
    
    var body: some View {
        VStack(spacing: 64) {
            ResultView(quiz: quiz)
            
            Button("Начать заново") {
                
            }
            .mainButtonStyle(state: .main)
        }
        .padding(.horizontal, 24)
        .whiteRoundedBackground()
    }
}

#Preview {
    EndQuizView()
}
