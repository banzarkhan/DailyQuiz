import SwiftUI

final class HistoryViewModel: ObservableObject {
    @Published var quizzes: [Quiz] = []
    @Published var showAlert: Bool = false
    
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
                self.showAlert = true
            }
        } catch {
            print("Error deleting quiz")
        }
    }
}
