import SwiftUI

extension View {
    func interFont(_ weight: InterWeight, size: CGFloat) -> some View {
        self.font(.custom(weight.rawValue, size: size))
    }

    func interRegular(_ size: CGFloat = 12) -> some View {
        interFont(.regular, size: size)
    }

    func interSemiBold(_ size: CGFloat = 12) -> some View {
        interFont(.semibold, size: size)
    }

    func interBold(_ size: CGFloat = 12) -> some View {
        interFont(.bold, size: size)
    }

    func interBlack(_ size: CGFloat = 12) -> some View {
        interFont(.black, size: size)
    }
}

