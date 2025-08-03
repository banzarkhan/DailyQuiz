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
        .navigationDestination(isPresented: $viewModel.startQuiz, destination: {
            QuizView(quiz: viewModel.quiz)
                .navigationBarBackButtonHidden()
                .onDisappear {
                    Task {
                        await viewModel.fetchQuizzes()
                    }
                }
        })
        .background(.purpleAccent)
        .customAlert(
            showAlert: $viewModel.showAlert,
            alertMessage: viewModel.alertMessage){
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
                    viewModel.startQuizTapped()
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

