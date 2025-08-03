import SwiftUI

struct HeaderView<Content: View>: View {
    @Environment(\.dismiss) var dismiss
    var content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
            ZStack {
                HStack {
                    Button {
                       dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .foregroundStyle(.white)
                            .frame(width: 24, height: 24)
                    }
                    Spacer()
                }
               content
            }
  
    }
}
