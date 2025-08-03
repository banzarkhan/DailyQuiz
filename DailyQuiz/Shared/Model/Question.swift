import Foundation

struct Question: Identifiable {
    var id: UUID
    var category: String
    var categoryId: Int?
    var type: String
    var difficulty: String
    var question: String
    var answers: [Answer]
    var selectedAnswerId: UUID?
    var correctAnswerId: UUID
}
