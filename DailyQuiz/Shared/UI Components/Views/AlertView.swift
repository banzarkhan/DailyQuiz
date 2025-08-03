import SwiftUI

struct AlertView: View {
    @Binding var showAlert: Bool
    var title: String
    var message: String
    var buttonLabel: String
    var action: () -> Void
    
    var body: some View {
        VStack(spacing: 40) {
            VStack(spacing: 12) {
                Text(title)
                    .interBold(24)
                    .foregroundStyle(.black)
                    Text(message)
                        .interBold(16)
                        .foregroundStyle(.black)
                        .multilineTextAlignment(.center)
            }
                Button(buttonLabel) {
                    action()
                }
                .mainButtonStyle(state: .main)
        }
        .padding(.horizontal, 24)
        .whiteRoundedBackground()
    }
}
