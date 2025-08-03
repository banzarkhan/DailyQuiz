import Foundation

struct Quiz: Identifiable {
    var id: UUID
    var result: Int
    var date: Date
    var questions: [Question]
    
    init(id: UUID = UUID(), result: Int = 0, date: Date = Date(), questions: [Question] = []) {
        self.id = id
        self.result = result
        self.questions = questions
        self.date = date
    }
}

extension Quiz {
    var resultTitle: String {
        switch result {
        case 5:
            return "Идеально!"
        case 4:
            return "Почти идеально!"
        case 3:
            return "Хороший результат!"
        case 2:
            return "Есть над чем поработать"
        case 1:
            return "Сложный вопрос?"
        default:
            return "Бывает и так!"
        }
    }
    
    var resultDescription: String {
        switch result {
        case 5:
            return "\(result)/5 — вы ответили на всё правильно. Это блестящий результат!"
        case 4:
            return "\(result)/5 — очень близко к совершенству. Ещё один шаг!"
        case 3:
            return "\(result)/5 — вы на верном пути. Продолжайте тренироваться!"
        case 2:
            return "\(result)/5 — не расстраивайтесь, попробуйте ещё раз!"
        case 1:
            return "\(result)/5 — иногда просто не ваш день. Следующая попытка будет лучше!"
        default:
            return "\(result)/5 — не отчаивайтесь. Начните заново и удивите себя!"
        }
    }
}

