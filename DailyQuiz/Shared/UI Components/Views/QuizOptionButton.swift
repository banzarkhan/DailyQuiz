import SwiftUI

struct QuizOptionButton: View {
    var text: String
    var state: QuizOptionState
    var disabled: Bool = false
    var action: () -> Void = {}
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 16) {
                state.icon
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                Text(text)
            }
        }
        .quizButtonStyle(state: state)
        .disabled(disabled)
    }
}
