import SwiftUI

struct Login: View {
    @State private var user = ""
    @State private var password = ""
    
    var body: some View {
        VStack {
            Text("Login").font(.largeTitle)
            
            Component_TextField(textFieldTitle: "User", textFieldText: $user)
            
            Spacer().frame(height: 20)
            
            Component_SecureField(secureFieldTitle: "Password", secureFieldText: $password)
            
            Spacer().frame(height: 20)
            
            Button(action: {
                // Aquí puedes agregar la acción que se ejecutará al hacer clic en el botón de inicio de sesión
            }
            ) {
                Text("Login")
                    .foregroundColor(Color.blue)
                    .font(.headline)
                    .frame(width: 220, height: 60)
                    .background(.white)
                    .cornerRadius(15.0)
            }
            
            Button(action: {
                // Aquí puedes agregar la acción que se ejecutará al hacer clic en el botón de inicio de sesión
            }
            ) {
                Text("Register")
                    .foregroundColor(.white)
                    .font(.headline)
                    .frame(width: 220, height: 60)
                    .background(Color.blue)
                    .cornerRadius(15.0)
            }
        }
        .padding()
    
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
