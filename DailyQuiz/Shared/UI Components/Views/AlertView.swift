import SwiftUI

struct AlertView: View {
    @Binding var showAlert: Bool
    var alertMessage: AlertMessage
    var action: () -> Void
    
    var body: some View {
        VStack(spacing: 40) {
            VStack(spacing: 12) {
                Text(alertMessage.title)
                    .interBold(24)
                    .foregroundStyle(.black)
                Text(alertMessage.message)
                        .interBold(16)
                        .foregroundStyle(.black)
                        .multilineTextAlignment(.center)
            }
            Button(alertMessage.buttonLabel) {
                    action()
                }
                .mainButtonStyle(state: .main)
        }
        .padding(.horizontal, 24)
        .whiteRoundedBackground()
    }
}
