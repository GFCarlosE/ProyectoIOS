import SwiftUI

struct Login: View {
    @State private var user = ""
    @State private var password = ""
    @State private var mensaje = ""
    
    @State private var alerta = false
    
   
    
    var body: some View {
        NavigationView{
            VStack {
                Text("Login").font(.largeTitle)
                
                Component_TextField(textFieldTitle: "User", textFieldText: $user)
                
                Spacer().frame(height: 20)
                
                Component_SecureField(secureFieldTitle: "Password", secureFieldText: $password)
                
                Spacer().frame(height: 20)
                
                Button("Login"){
                    // Aquí puedes agregar la acción que se ejecutará al hacer clic en el botón de inicio de sesión
                    checkLogin()
                }.foregroundColor(Color.blue)
                    .font(.headline)
                    .frame(width: 220, height: 60)
                    .alert(isPresented: $alerta){
                        Alert(title: Text("Alerta"),message:Text("\(mensaje)"),dismissButton: .default(Text("Ok")))
                    }
                
                NavigationLink(destination: User(), label: {
                    Text("Sign Up").foregroundColor(.white)
                        .font(.headline)
                        .frame(width: 220, height: 60)
                        .background(Color.blue)
                        .cornerRadius(15.0)
                })
            }
            .padding()
            
          
        }
    }
    
    func checkLogin() {
        if([user,password].contains("")){
            mensaje = "Ingresa todos los campos"
            alerta = true
       }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
