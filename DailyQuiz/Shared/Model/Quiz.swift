import Foundation

struct Quiz: Identifiable {
    var id: UUID
    var questions: [Question]
    
    init(id: UUID = UUID(), questions: [Question] = []) {
        self.id = id
        self.questions = questions
    }
}
