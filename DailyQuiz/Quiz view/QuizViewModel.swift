import SwiftUI

final class QuizViewModel: ObservableObject {
    @Published var quiz = Quiz()
    @Published var currentQuestionIndex: Int = 0
    @Published var buttonState: MainButtonState = .disabled
    
    var questionNumber: Int {
        currentQuestionIndex + 1
    }
    
    var currentQuestion: Question {
        quiz.questions[currentQuestionIndex]
    }
    
    init(quiz: Quiz) {
        self.quiz = quiz
    }
    
    func handleButtonTap() {
        if quiz.questions[currentQuestionIndex].selectedAnswerId != nil && currentQuestionIndex < quiz.questions.count - 1 {
            currentQuestionIndex += 1
        } else {
            saveQuiz()
        }
    }
    
    func saveQuiz() {
        print("Quiz saved")
    }
    
}
