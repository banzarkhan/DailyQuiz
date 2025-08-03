import SwiftUI

struct ResultQuestionView: View {
    var questionNumber: Int
    @Binding var question: Question
    
    var body: some View {
        VStack(spacing: 65) {
            VStack(spacing: 24) {
                HStack {
                    Text("Вопрос \(questionNumber) из 5")
                        .interBold(16)
                        .foregroundStyle(.grayTextSecondary)
                    Spacer()
                    Image(.optionCorrect)
                }
                Text(question.question)
                    .interSemiBold(18)
                    .foregroundStyle(.black)
                    .multilineTextAlignment(.center)
                VStack(spacing: 16) {
                    ForEach(question.answers) { answer in
                        QuizOptionButton(text: answer.text, state: setButtonState(answer, selectedAnswerId: question.selectedAnswerId ?? UUID()), disabled: true)
                    }
                }
            }
        }
        .padding(.horizontal, 30)
        .whiteRoundedBackground()
    }
}

extension ResultQuestionView {
    
    private func setButtonState(_ answer: Answer, selectedAnswerId: UUID) -> QuizOptionState {
        if answer.id == selectedAnswerId {
            if answer.isCorrect {
               return .correct
            } else {
                return .incorrect
            }
        } else {
            return .idle
        }
    }
}
