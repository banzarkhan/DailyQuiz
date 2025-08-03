import SwiftUI

struct EndQuizView: View {
    @ObservedObject var viewModel: QuizViewModel
    @State var showResults: Bool = false
    
    var body: some View {
        if showResults {
            ReviewResultsView(quiz: viewModel.quiz, action: viewModel.resetQuizAndStartOver)
        } else {
            VStack {
                VStack(spacing: 64) {
                    ResultView(quiz: viewModel.quiz)
                        .onTapGesture {
                            withAnimation {
                                showResults = true
                            }
                        }
                    
                    Button("Начать заново") {
                        viewModel.resetQuizAndStartOver()
                    }
                    .mainButtonStyle(state: .main)
                }
                .padding(.horizontal, 24)
                .whiteRoundedBackground()
            }
            .padding(.horizontal)
        }
    }
}
