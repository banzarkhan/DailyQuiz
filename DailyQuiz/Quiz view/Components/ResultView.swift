import SwiftUI

struct ResultView: View {
    var quiz = Quiz(result: 3)
    
    var body: some View {
            VStack(spacing: 24) {
                HStack {
                    ForEach(0..<5, id: \.self) { index in
                        let result = Array(0..<quiz.result)
                        Image(result.contains(index) ? .starFilled : .starEmpty)
                    }
                }
                
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

#Preview {
    ResultView()
}
