import SwiftUI

struct StartBannerView: View {
    var isError: Bool
    var action: () -> Void
    
    var body: some View {
        VStack(spacing: 24) {
            VStack(spacing: 40) {
                Text("Добро пожаловать в DailyQuiz")
                    .interBold(28)
                    .multilineTextAlignment(.center)
                
                Button("Начать викторину") {
                    action()
                }
                .mainButtonStyle(state: .main)
            }
            .whiteRoundedBackground()
            if isError {
                Text("Ошибка! Попробуйте ещё раз")
                    .interBold(20)
                    .foregroundStyle(.white)
            }
        }
    }
}
