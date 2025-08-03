import SwiftUI

struct QuestionView: View {
    var questionNumber: Int
    @Binding var question: Question
    var action: () -> Void
    @State var buttonState: MainButtonState = .disabled
    
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
                        QuizOptionButton(text: answer.text, state: answer.id == question.selectedAnswerId ? .selected : .idle) {
                            question.selectedAnswerId = answer.id
                        }
                    }
                }
            }
            Button(questionNumber == 5 ? "Завершить" : "Далее") {
                action()
            }
            .mainButtonStyle(state: buttonState)
        }
        .onChange(of: question.selectedAnswerId) { newValue in
            if newValue != nil {
                buttonState = .main
            } else {
                buttonState = .disabled
            }
        }
        .padding(.horizontal, 30)
        .whiteRoundedBackground()
    }
}
