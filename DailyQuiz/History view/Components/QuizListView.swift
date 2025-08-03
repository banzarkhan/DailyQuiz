import SwiftUI

struct QuizListView: View {
    @ObservedObject var viewModel: HistoryViewModel
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                ForEach(Array(viewModel.quizzes.enumerated()), id: \.element.id) { index, quiz in
                    NavigationLink {
                        ReviewResultsView(quiz: quiz, action: {})
                            .navigationBarBackButtonHidden()
                    } label: {
                        quizRow(quiz, title: "Quiz \(index + 1)")
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
            }
            .padding()
        }
    }
}

extension QuizListView {
    @ViewBuilder
    private func quizRow(_ quiz: Quiz, title: String) -> some View {
        VStack(spacing: 12) {
            HStack {
                Text(title)
                    .interBold(24)
                    .foregroundStyle(.purplePrimaryDark)
                Spacer()
                StarsView(result: quiz.result, starSize: 16)
            }
            HStack {
                Text(quiz.date.formattedWithoutYearIfCurrent())
                Spacer()
                Text(quiz.date.formattedTime())
            }
            .interRegular()
        }
        .padding(.horizontal, 24)
        .whiteRoundedBackground(cornerRadius: 40)
    }
}
