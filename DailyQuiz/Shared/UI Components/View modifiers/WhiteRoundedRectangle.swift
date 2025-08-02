import SwiftUI

struct WhiteRoundedRectangleViewModifier: ViewModifier {
    var cornerRadius: CGFloat
    var verticalPadding: CGFloat
    var horizontalPadding: CGFloat
    
    func body(content: Content) -> some View {
        content
            .padding(.vertical, verticalPadding)
            .padding(.horizontal, horizontalPadding)
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .foregroundColor(.white)
            )
    }
}

extension View {
    
    func whiteRoundedBackground(
        cornerRadius: CGFloat = 46,
        verticalPadding: CGFloat = 32,
        horizontalPadding: CGFloat = 24
    ) -> some View {
        modifier(
            WhiteRoundedRectangleViewModifier(
                cornerRadius: cornerRadius,
                verticalPadding: verticalPadding,
                horizontalPadding: horizontalPadding
            )
        )
    }
}
