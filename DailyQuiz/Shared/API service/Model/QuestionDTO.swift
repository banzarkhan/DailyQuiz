import Foundation

struct QuestionDTO: Decodable {
    let category: String
    let type: String
    let difficulty: String
    let question: String
    let correct_answer: String
    let incorrect_answers: [String]
}

extension QuestionDTO {
    func toQuestion() -> Question {
        
        var answers: [Answer] = []
        answers.append(Answer(id: UUID(), text: correct_answer.decodeHTMLEntities(), isCorrect: true))
        answers.append(contentsOf: incorrect_answers.map { text in
                .init(id: UUID(), text: text.decodeHTMLEntities(), isCorrect: false)
        })
        
        answers.shuffle()
        
        return Question(
            id: UUID(),
            category: category,
            type: type,
            difficulty: difficulty,
            question: question.decodeHTMLEntities(),
            answers: answers
        )
    }
}
