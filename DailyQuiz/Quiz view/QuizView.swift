import SwiftUI

struct QuizView: View {
    @StateObject var viewModel: QuizViewModel
    
    init(quiz: Quiz, state: QuizViewState = .quiz) {
        _viewModel = StateObject(wrappedValue: QuizViewModel(quiz: quiz, state: state))
    }
    
    var body: some View {
        ZStack {
            VStack {
                HeaderView {
                    if viewModel.viewState == .result {
                        Text("Результаты")
                            .interBlack(32)
                            .foregroundStyle(.white)
                    } else {
                        Image(.logo)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 180)
                    }
                }
                Spacer()
            }
            switch viewModel.viewState {
            case .quiz, .startAgain:
                VStack(spacing: 16) {
                    QuestionView(questionNumber: viewModel.questionNumber, question: $viewModel.quiz.questions[viewModel.currentQuestionIndex]) {
                        viewModel.handleButtonTap()
                    }
                    Text("Вернуться к предыдущим вопросам нельзя")
                        .interRegular()
                        .foregroundStyle(.white)
                }
            case .result:
                EndQuizView(viewModel: viewModel)
            }
            
        }
        .padding()
        .background(.purpleAccent)
    }
}
