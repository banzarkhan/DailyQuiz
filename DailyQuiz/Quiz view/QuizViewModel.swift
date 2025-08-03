import SwiftUI

final class QuizViewModel: ObservableObject {
    @Published var quiz = Quiz()
    @Published var currentQuestionIndex: Int = 0
    @Published var buttonState: MainButtonState = .disabled
    
    var questionNumber: Int {
        currentQuestionIndex + 1
    }
    
    let dataManager = PersistenceManager.shared
    
    init(quiz: Quiz) {
        self.quiz = quiz
    }
    
    func handleButtonTap() {
        let currentQuestion = quiz.questions[currentQuestionIndex]
        if currentQuestion.selectedAnswerId != nil && currentQuestionIndex < quiz.questions.count - 1 {
            currentQuestionIndex += 1
            setResult(from: currentQuestion)
        } else {
            Task {
                await saveQuiz()
            }
        }
    }
    
    func setResult(from question: Question) {
        if question.selectedAnswerId == question.correctAnswerId {
            quiz.result += 1
        }
    }
    
    func saveQuiz() async {
        do {
            let newQuiz = dataManager.createEntity(ofType: QuizEntity.self)
            newQuiz.create(from: quiz)
            try dataManager.saveEntity(newQuiz)
            print("Successfully saved quiz! with id: \(String(describing: newQuiz.id))")
        } catch {
            print("Error saving quiz: \(error.localizedDescription)")
        }
    }
    
}
