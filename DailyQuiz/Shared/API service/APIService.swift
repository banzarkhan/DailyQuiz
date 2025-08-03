import SwiftUI

struct APIService {
    
    static let shared = APIService()
    
    func fetchQuestions(amount: Int = 5, category: Int? = nil, difficulty: String? = nil) async throws -> [Question] {
        var urlString = "https://opentdb.com/api.php?amount=\(amount)"
        if let category = category {
            urlString += "&category=\(category)"
        }
        if let difficulty = difficulty {
            urlString += "&difficulty=\(difficulty)"
        }
        
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoded = try JSONDecoder().decode(ApiQuestionsResponse.self, from: data)
        return decoded.results.map { $0.toQuestion() }
    }

}
