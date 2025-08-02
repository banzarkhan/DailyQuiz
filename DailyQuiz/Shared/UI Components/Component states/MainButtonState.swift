import SwiftUI

enum MainButtonState {
    case main
    case disabled
    case startAgain
    
    var textColor: Color {
        switch self {
        case .main:
            return .white
        case .disabled:
            return .white
        case .startAgain:
            return .purplePrimaryDark
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .main:
            return .purpleAccent
        case .disabled:
            return .grayTextSecondary
        case .startAgain:
            return .white
        }
    }
}
