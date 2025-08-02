import SwiftUI

struct QuizOptionButtonStyle: ButtonStyle {
    let state: QuizOptionState

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.interRegular14)
            .foregroundColor(state.textColor)
            .padding()
            .frame(maxWidth: .infinity, minHeight: 50, alignment: .leading)
            .background(state.backgroundColor)
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(state.borderColor, lineWidth: 1)
            )
            .opacity(configuration.isPressed ? 0.6 : 1)
    }
}

extension View {
    func quizButtonStyle(state: QuizOptionState) -> some View {
        self
            .buttonStyle(QuizOptionButtonStyle(state: state))
    }
}

enum QuizOptionState {
    case idle
    case selected
    case correct
    case incorrect

    var backgroundColor: Color {
        switch self {
        case .idle: .grayBackgroundLight
        case .selected, .correct, .incorrect: .white
        }
    }

    var textColor: Color {
        switch self {
        case .idle: .black
        case .selected: .purplePrimaryDark
        case .correct: .greenSuccess
        case .incorrect: .redError
        }
    }

    var borderColor: Color {
        switch self {
        case .correct: .greenSuccess
        case .incorrect: .redError
        case .selected: .purplePrimaryDark
        case .idle: .clear
        }
    }
    
    var icon: Image {
        switch self {
        case .idle:
            Image(.optionIdle)
        case .selected:
            Image(.optionSelected)
        case .correct:
            Image(.optionCorrect)
        case .incorrect:
            Image(.optionIncorrect)
        }
    }
}
