import CoreData

extension AnswerEntity {
    
    func toModel() -> Answer {
        return Answer(
            id: self.id ?? UUID(),
            text: self.text ?? "",
            isCorrect: self.isCorrect
        )
    }
    
    func create(from model: Answer) {
        self.id = model.id
        self.isCorrect = model.isCorrect
        self.text = model.text
    }
}


