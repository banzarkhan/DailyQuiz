import CoreData

extension QuestionEntity {
    
    func toModel() -> Question {
        return Question(
            id: self.id ?? UUID(),
            category: self.category ?? "",
            categoryId: Int(self.categoryId),
            type: self.type ?? "",
            difficulty: self.difficulty ?? "",
            question: self.question ?? "",
            answers: (self.answers as? Set<AnswerEntity>)?.map { $0.toModel() } ?? [],
            selectedAnswerId: self.selectedAnswerId,
            correctAnswerId: self.correctAnswerId ?? UUID()
        )
    }
    
    func create(from model: Question) {
        self.id = model.id
        self.category = model.category
        self.categoryId = Int32(model.categoryId ?? 0)
        self.type = model.type
        self.difficulty = model.difficulty
        self.question = model.question
        self.selectedAnswerId = model.selectedAnswerId
        self.correctAnswerId = model.correctAnswerId
        
        for answer in model.answers {
            let answerEntity = AnswerEntity(context: PersistenceManager.shared.persistentContainer.viewContext)
            answerEntity.create(from: answer)
            self.addToAnswers(answerEntity)
        }
    }
}
