import SwiftUI

struct ReviewResultsView: View {
    @State var quiz: Quiz
    var action: () -> Void
    
    var body: some View {
        VStack {
            HeaderView {
                Text("Результаты")
                    .interBold(32)
                    .foregroundStyle(.white)
            }
            .padding(.horizontal)
            ScrollView {
                VStack(spacing: 36) {
                    ResultView(quiz: quiz)
                        .whiteRoundedBackground()
                    VStack(spacing: 24) {
                        Text("Твои ответы")
                            .interBold(32)
                            .foregroundStyle(.white)
                        
                        ForEach(Array(quiz.questions.enumerated()), id: \.element.id) { index, question in
                            ResultQuestionView(questionNumber: index + 1, question: $quiz.questions[index])
                        }
                        
                        Button("Начать заново") {
                            action()
                        }
                        .mainButtonStyle(state: .startAgain)
                    }
                }
                .padding(.horizontal)
            }
        }
        .background(.purpleAccent)
    }
}
