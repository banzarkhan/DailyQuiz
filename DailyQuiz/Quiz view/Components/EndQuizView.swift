import SwiftUI

struct EndQuizView: View {
    @ObservedObject var viewModel: QuizViewModel
    
    var body: some View {
        VStack(spacing: 64) {
            ResultView(quiz: viewModel.quiz)
            
            Button("Начать заново") {
                viewModel.resetQuizAndStartOver()
            }
            .mainButtonStyle(state: .main)
        }
        .padding(.horizontal, 24)
        .whiteRoundedBackground()
    }
}
