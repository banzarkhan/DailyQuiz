import SwiftUI

struct QuizView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel: QuizViewModel
    
    init(quiz: Quiz) {
        _viewModel = StateObject(wrappedValue: QuizViewModel(quiz: quiz))
    }
    
    var body: some View {
        ZStack {
            VStack {
                headerView
                Spacer()
            }
            VStack(spacing: 16) {
                QuestionView(questionNumber: viewModel.questionNumber, question: $viewModel.quiz.questions[viewModel.currentQuestionIndex]) {
                    viewModel.handleButtonTap()
                }
                Text("Вернуться к предыдущим вопросам нельзя")
                    .interRegular()
                    .foregroundStyle(.white)
            }
        }
        .padding()
        .background(.purpleAccent)
    }
    
    var headerView: some View {
        ZStack {
            HStack {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.white)
                        .frame(width: 24, height: 24)
                }
                Spacer()
            }
            Image(.logo)
                .resizable()
                .scaledToFit()
                .frame(width: 180)
        }
    }
}
