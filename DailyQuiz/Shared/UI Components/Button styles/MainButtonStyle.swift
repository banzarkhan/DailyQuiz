import SwiftUI

struct MainButtonStyle: ButtonStyle {
    var state: MainButtonState = .disabled
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .interBlack(16)
            .textCase(.uppercase)
            .foregroundColor(state.textColor)
            .frame(width: 280, height: 50)
            .background(state.backgroundColor)
            .cornerRadius(16)
            .opacity(configuration.isPressed ? 0.5 : 1)
    }
}

extension View {
    func mainButtonStyle(state: MainButtonState) -> some View {
        self
            .buttonStyle(MainButtonStyle(state: state))
            .disabled(state == .disabled)
    }
}
