import SwiftUI

struct StartScreenView: View {
    @StateObject var viewModel = StartScreenViewModel()
    
    var body: some View {
        ZStack {
            VStack {
                NavigationLink {
                    
                } label: {
                    historyButton
                        .padding(.top, 30)
                }
                Spacer()
            }
            VStack(spacing: 40) {
                Image(.logo)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
                
                if viewModel.isLoading {
                    Image(.loader)
                        .frame(maxWidth: .infinity)
                        .frame(height: 220)
                } else {
                    StartBannerView(isError: viewModel.showError) {
                        viewModel.startQuizTapped()
                    }
                }
            }
        }
        .padding()
        .background(.purpleAccent)
        .navigationDestination(isPresented: $viewModel.startQuiz) {
            
        }
    }
    
    var historyButton: some View {
        HStack(spacing: 12) {
            Text("История")
                .interSemiBold(12)
                .foregroundStyle(.purpleAccent)
            Image(.history)
                .resizable()
                .scaledToFit()
                .frame(width: 16, height: 16)
        }
        .padding(12)
        .background(
            RoundedRectangle(cornerRadius: 24)
                .fill(.white)
        )
    }
}

#Preview {
    StartScreenView()
}
