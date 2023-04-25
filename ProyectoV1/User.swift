//
//  User.swift
//  ProyectoV1
//
//  Created by ISSC_611_2023 on 24/04/23.
//

import SwiftUI

struct User: View {
    @State private var id = ""
    @State private var name = ""
    @State private var lastname = ""
    @State private var age = ""
    @State private var gender = ""
    @State private var emailUser = ""
    @State private var password = ""
    @State private var mess = ""
    @State private var mostrarAlerta = false
    var body: some View {
        VStack{
            Text("User").font(.largeTitle).padding()
            
            HStack{
                VStack{
                    TextField("Id", text: $id)
                    TextField("Name", text: $name)
                    TextField("LastName", text: $lastname)
                    TextField("Age", text: $age)
                    TextField("Gender", text: $gender)
                    TextField("Email or User", text: $emailUser)
                    SecureField("Password", text: $password)
                }.padding(.horizontal, 100)
                
            }
            

                
            
            Button("Generate Sale"){
                mostrarAlerta = false
                
                if (id == "" || name == "" || lastname == "" || age == "" || gender == "" || emailUser == "" || password == ""){
                    id = ""
                    name = ""
                    lastname = ""
                    age = ""
                    gender = ""
                    emailUser = ""
                    password = ""
                    
                    mess = "At least one field is empty"
                    mostrarAlerta = true
                }else if(password == "111"){
                    
                }else{
                    mess = "All data accepted"
                    mostrarAlerta = true
                }
            }.padding()
                .alert(isPresented: $mostrarAlerta){
                    Alert(title: Text("Validation Failed"),message: Text(mess))
                }
            
        }
    }
}

struct User_Previews: PreviewProvider {
    static var previews: some View {
        User()
    }
}
