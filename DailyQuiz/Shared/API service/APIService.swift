import SwiftUI

struct APIService {
    
    static let shared = APIService()
    
    func fetchQuestions(amount: Int = 10, category: Int? = nil, difficulty: String? = nil) -> [Question] {
        var result: [Question] = []
        
        var urlString = "https://opentdb.com/api.php?amount=\(amount)"
        if let category = category {
            urlString += "&category=\(category)"
        }
        if let difficulty = difficulty {
            urlString += "&difficulty=\(difficulty)"
        }
        
        guard let url = URL(string: urlString) else {
            print("❌ Invalid URL")
            return result
        }
        
        Task {
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let decoded = try JSONDecoder().decode(ApiQuestionsResponse.self, from: data)
                result = decoded.results.map { $0.toQuestion() }
                
            } catch {
                print("❌ Error fetching questions: \(error)")
            }
        }
        return result
    }
}
