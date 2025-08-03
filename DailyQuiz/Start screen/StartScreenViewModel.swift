import SwiftUI

final class StartScreenViewModel: ObservableObject {
    @Published var quiz = Quiz()
    
    @Published var startQuiz: Bool = false
    @Published var goToHistory: Bool = false
    @Published var isLoading: Bool = false
    @Published var showError: Bool = false
    
    let apiService = APIService.shared
    
    func startQuizTapped() {
        isLoading = true
        
        Task {
            do {
                let questions = try await apiService.fetchQuestions(amount: 5, category: 23, difficulty: "medium")
                await MainActor.run {
                    self.quiz.questions = questions
                    self.isLoading = false
                    self.startQuiz = true
                    print(self.quiz)
                }
            } catch {
                await MainActor.run {
                    self.isLoading = false
                    self.showError = true
                }
            }
        }
    }
}
