import Foundation

struct Answer: Identifiable , Hashable, Equatable{
    var id: UUID
    var text: String
    var isCorrect: Bool
}
