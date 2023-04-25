import SwiftUI

struct Component_TextField: View {
    @State var textFieldTitle: String
    @State var textFieldText: Binding<String>
    
    var body: some View {
        TextField(textFieldTitle, text: textFieldText).padding()
            .background(Color.gray.opacity(0.2))
            .cornerRadius(5.0)
            .padding(.horizontal)
    }
}
