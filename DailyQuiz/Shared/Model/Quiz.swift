import Foundation

struct Quiz: Identifiable {
    var id: UUID
    var result: Int
    var questions: [Question]
    
    init(id: UUID = UUID(), result: Int = 0, questions: [Question] = []) {
        self.id = id
        self.result = result
        self.questions = questions
    }
}
