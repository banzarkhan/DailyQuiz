import SwiftUI

struct ResultView: View {
    var quiz: Quiz
    
    var body: some View {
            VStack(spacing: 24) {
                StarsView(result: quiz.result)
                
                Text("\(quiz.result) из 5")
                    .interBold(16)
                    .foregroundStyle(.yellowAccent)
                VStack(spacing: 12) {
                    Text(quiz.resultTitle)
                        .interBold(24)
                    
                    Text(quiz.resultDescription)
                        .interRegular(16)
                        .multilineTextAlignment(.center)
                }
            }
    }
}
