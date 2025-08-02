import SwiftUI

struct QuizView: View {
    var question: Question = Question(id: UUID(), category: "HHHH", type: "hhhh", difficulty: "hkjjkhj", question: "jhkhkhkhkhj", answers: [
        Answer(id: UUID(), text: "jkljkjkjljk", isCorrect: false),
        Answer(id: UUID(), text: "hhhhhhhhh", isCorrect: false),
        Answer(id: UUID(), text: "PPPPPPPPPP", isCorrect: true),
        Answer(id: UUID(), text: "ddddddddd", isCorrect: false),
    ])
    
    var body: some View {
        ZStack {
            VStack {
                headerView
                Spacer()
            }
            VStack(spacing: 16) {
                QuestionView(questionNumber: 1, question: question)
                Text("Вернуться к предыдущим вопросам нельзя")
                    .interRegular()
            }
        }
        .padding()
        .background(.purpleAccent)
    }
    
    var headerView: some View {
        ZStack {
            HStack {
                Button {
                    
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

#Preview {
    QuizView()
}
