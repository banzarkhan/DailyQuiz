import SwiftUI

struct QuizListView: View {
    @ObservedObject var viewModel: HistoryViewModel
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                ForEach(viewModel.quizzes) { quiz in
                    quizRow(quiz)
                        .contextMenu {
                            Button(role: .destructive) {
                                Task {
                                    await viewModel.deleteQuiz(quiz)
                                }
                            } label: {
                                Label("Удалить", systemImage: "trash")
                            }
                        }
                }
            }
            .padding()
        }
    }
}

extension QuizListView {
    @ViewBuilder
    private func quizRow(_ quiz: Quiz) -> some View {
        VStack(spacing: 12) {
            HStack {
                Text("Quiz 1")
                    .interBold(24)
                    .foregroundStyle(.purplePrimaryDark)
                Spacer()
                StarsView(result: quiz.result, starSize: 16)
            }
            HStack {
                Text("7 июля")
                Spacer()
                Text("12:07")
            }
            .interRegular()
        }
        .padding(.horizontal, 24)
        .whiteRoundedBackground(cornerRadius: 40)
    }
}
