import SwiftUI

final class QuizViewModel: ObservableObject {
    @Published var quiz = Quiz()
    @Published var viewState: QuizViewState = .quiz
    @Published var currentQuestionIndex: Int = 0
    @Published var buttonState: MainButtonState = .disabled
    
    var questionNumber: Int {
        currentQuestionIndex + 1
    }
    
    let dataManager = PersistenceManager.shared
    
    init(quiz: Quiz, state: QuizViewState) {
        self.quiz = quiz
        self.viewState = state
    }
    
    func handleButtonTap() {
        let currentQuestion = quiz.questions[currentQuestionIndex]
        if currentQuestion.selectedAnswerId != nil && currentQuestionIndex < quiz.questions.count - 1 {
            currentQuestionIndex += 1
            setResult(from: currentQuestion)
        } else {
            upsertQuiz()
        }
    }
    
    private func upsertQuiz() {
        guard .quiz == viewState || .startAgain == viewState else { return }
        
        Task {
            switch viewState {
            case .quiz:
                await saveQuiz()
            case .startAgain:
                await updateQuiz()
            case .result:
                break
            }
        }
        
        viewState = .result
    }
    
    private func setResult(from question: Question) {
        if question.selectedAnswerId == question.correctAnswerId {
            quiz.result += 1
        }
    }
    
    private func saveQuiz() async {
        do {
            let newQuiz = dataManager.createEntity(ofType: QuizEntity.self)
            newQuiz.create(from: quiz)
            try dataManager.saveEntity(newQuiz)
            print("Successfully saved quiz! with id: \(String(describing: newQuiz.id))")
        } catch {
            print("Error saving quiz: \(error.localizedDescription)")
        }
    }
    
    private func updateQuiz() async {
        do {
            let predicate = NSPredicate(format: "id == %@", quiz.id as CVarArg)
            guard let fetchedQuiz = try dataManager.fetchEntities(ofType: QuizEntity.self, predicate: predicate).first else {
                print("Quiz not found")
                return
            }

            fetchedQuiz.result = Int32(quiz.result)

            let questionsSet = fetchedQuiz.questions as? Set<QuestionEntity> ?? []
            for questionEntity in questionsSet {
                if let updatedQuestion = quiz.questions.first(where: { $0.id == questionEntity.id }) {
                    questionEntity.selectedAnswerId = updatedQuestion.selectedAnswerId
                }
            }

            try dataManager.saveChanges()

        } catch {
            print("Error updating quiz: \(error)")
        }
    }

    func resetQuizAndStartOver() {
        quiz.questions = quiz.questions.map { question in
            var updatedQuestion = question
            updatedQuestion.selectedAnswerId = nil
            return updatedQuestion
        }
        
        quiz.result = 0
        currentQuestionIndex = 0
        viewState = .startAgain
    }
    
}
