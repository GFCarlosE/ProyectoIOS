import SwiftUI

struct Component_SecureField: View {
    @State var secureFieldTitle: String
    @State var secureFieldText: Binding<String>
    
    var body: some View {
        SecureField(secureFieldTitle, text: secureFieldText).padding()
            .background(Color.gray.opacity(0.2))
            .cornerRadius(5.0)
            .padding(.horizontal)
    }
}

