import SwiftUI

struct QuestionView: View {
    var questionNumber: Int
    var question: Question
    @State var selectedAnswer: Answer?
    
    var body: some View {
        VStack(spacing: 65) {
            VStack(spacing: 24) {
                Text("Вопрос \(questionNumber) из 5")
                    .interBold(16)
                    .foregroundStyle(.purpleAccentLight)
                Text(question.question)
                    .interSemiBold(18)
                    .foregroundStyle(.black)
                    .multilineTextAlignment(.center)
                VStack(spacing: 16) {
                    ForEach(question.answers) { answer in
                        QuizOptionButton(text: answer.text, state: answer == selectedAnswer ? .selected : .idle) {
                            selectedAnswer = answer
                        }
                    }
                }
            }
            Button(questionNumber == 5 ? "Завершить" : "Далее") {
                
            }
            .mainButtonStyle(state: .disabled)
        }
        .padding(.horizontal, 30)
        .whiteRoundedBackground()
    }
}
