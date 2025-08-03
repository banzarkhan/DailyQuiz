import SwiftUI

struct StarsView: View {
    var result: Int
    var starSize: CGFloat = 52
    
    var body: some View {
        HStack {
            ForEach(0..<5, id: \.self) { index in
                let result = Array(0..<result)
                Image(result.contains(index) ? .starFilled : .starEmpty)
                    .resizable()
                    .scaledToFit()
                    .frame(width: starSize, height: starSize)
            }
        }
    }
}
