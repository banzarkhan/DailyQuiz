import SwiftUI

struct AlertOverlayModifier: ViewModifier {
    @Binding var showAlert: Bool
    var title: String
    var message: String
    var buttonLabel: String
    var action: () -> Void
    
    func body(content: Content) -> some View {
        content
            .overlay {
                if showAlert {
                    ZStack {
                        AlertView(
                            showAlert: $showAlert,
                            title: title,
                            message: message,
                            buttonLabel: buttonLabel,
                            action: action
                        )
                        .padding(.horizontal)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(.ultraThickMaterial.opacity(0.7))
                    .environment(\.colorScheme, .dark)
                }
            }
    }
}

extension View {
    func customAlert(
        showAlert: Binding<Bool>,
        title: String,
        message: String,
        buttonLabel: String,
        action: @escaping () -> Void
    ) -> some View {
        self.modifier(
            AlertOverlayModifier(
                showAlert: showAlert,
                title: title,
                message: message,
                buttonLabel: buttonLabel,
                action: action
            )
        )
    }
}
