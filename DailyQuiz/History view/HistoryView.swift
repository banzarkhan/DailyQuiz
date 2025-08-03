import SwiftUI

struct HistoryView: View {
    @StateObject var viewModel = HistoryViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            HeaderView {
                Text("История")
                    .interBlack(32)
                    .foregroundStyle(.white)
            }
            .padding()
            if viewModel.quizzes.isEmpty {
                placeholder
                    .padding()
            } else {
                QuizListView(viewModel: viewModel)
            }
        }
        .background(.purpleAccent)
        .customAlert(
            showAlert: $viewModel.showAlert,
            title: "Попытка удалена",
            message: "Вы можете пройти викторину снова, когда будете готовы.",
            buttonLabel: "Хорошо"){
                viewModel.showAlert = false
            }
    }
    
    var placeholder: some View {
        VStack {
            VStack(spacing: 40) {
                Text("Вы еще не проходили ни одной викторины")
                    .interRegular(20)
                    .multilineTextAlignment(.center)
                
                Button("Начать викторину") {
                    
                }
                .mainButtonStyle(state: .main)
            }
            .whiteRoundedBackground()
            Spacer()
            Image(.logo)
                .resizable()
                .scaledToFit()
                .frame(width: 180, height: 100)
        }
    }
}

