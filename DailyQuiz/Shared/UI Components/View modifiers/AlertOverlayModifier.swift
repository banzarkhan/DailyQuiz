import SwiftUI

struct AlertOverlayModifier: ViewModifier {
    @Binding var showAlert: Bool
    var alertMessage: AlertMessage
    var action: () -> Void
    
    func body(content: Content) -> some View {
        content
            .overlay {
                if showAlert {
                    ZStack {
                        AlertView(
                            showAlert: $showAlert,
                            alertMessage: alertMessage,
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
        alertMessage: AlertMessage,
        action: @escaping () -> Void
    ) -> some View {
        self.modifier(
            AlertOverlayModifier(
                showAlert: showAlert,
                alertMessage: alertMessage,
                action: action
            )
        )
    }
}
