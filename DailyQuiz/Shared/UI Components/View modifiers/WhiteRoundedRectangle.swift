import SwiftUI

struct WhiteRoundedRectangleViewModifier: ViewModifier {
    var cornerRadius: CGFloat
    var verticalPadding: CGFloat
    
    func body(content: Content) -> some View {
        content
            .padding(.vertical, verticalPadding)
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .foregroundColor(.white)
            )
    }
}

extension View {
    
    func whiteRoundedBackground(
        cornerRadius: CGFloat = 46,
        verticalPadding: CGFloat = 32
    ) -> some View {
        modifier(
            WhiteRoundedRectangleViewModifier(
                cornerRadius: cornerRadius,
                verticalPadding: verticalPadding
            )
        )
    }
}
