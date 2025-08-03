import SwiftUI

final class HistoryViewModel: ObservableObject {
    @Published var quizzes: [Quiz] = []
    @Published var quiz = Quiz()
    
    @Published var alertMessage: AlertMessage = .init(title: "", message: "", buttonLabel: "")
    @Published var showAlert: Bool = false
    @Published var startQuiz: Bool = false
    
    let dataManager: PersistenceManager = .shared
    
    init() {
        Task {
            await fetchQuizzes()
        }
    }
    
    func fetchQuizzes() async {
        do {
            let sortDescriptor = NSSortDescriptor(key: "date", ascending: true)
            let fetchedQuizzes = try dataManager.fetchEntities(
                ofType: QuizEntity.self,
                sortDescriptors: [sortDescriptor]
            )

            await MainActor.run {
                self.quizzes = fetchedQuizzes.map { $0.toModel() }
            }
        } catch {
            print("No quizzes found")
        }
    }

    
    func deleteQuiz(_ quiz: Quiz) async {
        do {
            let predicate = NSPredicate(format: "id == %@", quiz.id as CVarArg)
            if let fetchedNote = try dataManager.fetchEntities(ofType: QuizEntity.self, predicate: predicate).first {
                try dataManager.deleteEntity(fetchedNote)
            }
            
            await fetchQuizzes()
            await MainActor.run {
                self.alertMessage = AlertMessage(title: "Попытка удалена", message: "Вы можете пройти викторину снова, когда будете готовы.", buttonLabel: "Хорошо")
                self.showAlert = true
            }
        } catch {
            print("Error deleting quiz")
        }
    }
    
    func startQuizTapped() {
        Task {
            do {
                let questions = try await APIService.shared.fetchQuestions(amount: 5)
                await MainActor.run {
                    self.quiz.questions = questions
                    self.startQuiz = true
                    print(self.quiz)
                }
            } catch {
                await MainActor.run {
                    self.alertMessage = AlertMessage(title: "Ошибка!", message: "Попробуйте ещё раз", buttonLabel: "Хорошо")
                    self.showAlert = true
                }
            }
        }
    }
}
