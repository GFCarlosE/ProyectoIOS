//
//  User.swift
//  ProyectoV1
//
//  Created by ISSC_611_2023 on 24/04/23.
//

import SwiftUI
import Combine

struct User: View {
    @State private var id = ""
    @State private var name = ""
    @State private var lastname = ""
    @State private var age = ""
    @State private var genre = ""
    @State private var emailUser = ""
    @State private var password = ""
    @State private var title = ""
    @State private var message = ""
    @State private var showAlert = false
    @State private var options = ["Man", "Woman"]
    @State private var selectedItem = ["Man", "Woman"]
    
    var body: some View {
        NavigationView{
            VStack{
                Text("User").font(.largeTitle).padding()
                
                HStack{
                    VStack{
                        Component_TextField(textFieldTitle: "Id", textFieldText: $id)
                            .keyboardType(.numberPad)
                            .onReceive(Just(id)){
                            value in
                            let filtered = "\(value)".filter { "0123456789".contains($0) }
                            if filtered != value {
                                self.id = "\(filtered)"
                            }
                            };
                        Component_TextField(textFieldTitle: "Name", textFieldText: $name)
                        Component_TextField(textFieldTitle: "LastName", textFieldText: $lastname)
                        Component_TextField(textFieldTitle: "Age", textFieldText: $age)
                            .keyboardType(.numberPad)
                            .onReceive(Just(age)){
                            value in
                            let filtered = "\(value)".filter { "0123456789".contains($0) }
                            if filtered != value {
                                self.age = "\(filtered)"
                            }
                            };
                        //Component_TextField(textFieldTitle: "Gender", textFieldText: $genre)
                        
                        Component_TextField(textFieldTitle: "Email or User", textFieldText: $emailUser)
                        Component_SecureField(secureFieldTitle: "Password", secureFieldText: $password)
                        Picker("Genre", selection: $genre){
                            ForEach(options, id: \.self){ item in
                                Text(item)
                            }
                        }.buttonBorderShape(.roundedRectangle)
                         .buttonStyle(.bordered)
                         .frame(maxWidth: .infinity)
                    }.padding(.horizontal, 20)
                }
                

                    
                
                Button("Generate Sale"){
                    validateFields()
                    showAlert = true
                }.padding()
                    .alert(isPresented: $showAlert){
                        Alert(title: Text(title),message: Text(message))
                    }
                NavigationLink(destination: Menu(),
                label: {
                    Text("Back to Menu")
                })
                
            }
        }
    }

    func isValidEmail(email: String) -> Bool {
        if(email.contains("@")){
            return true
        }
        return false
    }
    
    func validateFields(){
        let validEmail = isValidEmail(email: emailUser)
        print(validEmail)
        if([id, name, lastname, age, genre, emailUser, password].contains("")){
            title = "Error"
            message = "One or more fields are empty"
        }else if(!validEmail){
            title = "Error"
            message = "Write a correct email"
        } else{
            clean()
            title="Success"
            message="The fields were saved succesfully"
        }
    }
    
    func clean(){
        id=""
        name=""
        lastname=""
        age=""
        genre=""
        emailUser=""
        password=""
    }
    
}

struct User_Previews: PreviewProvider {
    static var previews: some View {
        User()
    }
}
