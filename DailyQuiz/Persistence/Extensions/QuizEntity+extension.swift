import CoreData

extension QuizEntity {
    
    func toModel() -> Quiz {
        return Quiz(
            id: self.id ?? UUID(),
            result: Int(self.result),
            date: self.date ?? Date(),
            questions: (self.questions as? Set<QuestionEntity>)?.map { $0.toModel() } ?? []
        )
    }
    
    func create(from model: Quiz) {
        self.id = model.id
        self.result = Int32(model.result)
        self.date = model.date
        
        for question in model.questions {
            let questionEntity = QuestionEntity(context: PersistenceManager.shared.persistentContainer.viewContext)
            questionEntity.create(from: question)
            self.addToQuestions(questionEntity)
        }
    }
}
