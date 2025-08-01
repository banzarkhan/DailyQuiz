import SwiftUI

extension Font {
    static let interRegular12:  Font = .custom(InterWeight.regular.rawValue, size: 12)
    static let interSemiBold12: Font = .custom(InterWeight.semibold.rawValue, size: 12)
    static let interRegular14:  Font = .custom(InterWeight.regular.rawValue, size: 14)
    static let interRegular16:  Font = .custom(InterWeight.regular.rawValue, size: 16)
    static let interBold16:     Font = .custom(InterWeight.bold.rawValue, size: 16)
    static let interBlack16:    Font = .custom(InterWeight.black.rawValue, size: 16)
    static let interSemiBold18: Font = .custom(InterWeight.semibold.rawValue, size: 18)
    static let interBold24:     Font = .custom(InterWeight.bold.rawValue, size: 24)
}

enum InterWeight: String {
    case bold      = "Inter-Bold"
    case regular   = "Inter-Regular"
    case semibold  = "Inter-SemiBold"
    case black     = "Inter-Black"
}
