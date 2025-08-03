import Foundation

struct ApiQuestionsResponse: Decodable {
    let response_code: Int
    let results: [QuestionDTO]
}
