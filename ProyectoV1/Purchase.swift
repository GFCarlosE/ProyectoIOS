//
//  Purchase.swift
//  ProyectoV1
//
//  Created by ISSC_611_2023 on 24/04/23.
//

import SwiftUI

struct Purchase: View {
    @State private var idProduct = ""
    @State private var name = ""
    @State private var pieces = ""
    @State private var ida = ""
    @State private var showAlert = false;
    @State private var message = "";
    var body: some View {
        
        //Color.blue.edgesIgnoringSafeArea(.all)
        VStack{
            Text("Purchase").font(.largeTitle).padding()
            Form{
                
                TextField("IdProduct",text: $idProduct);
                TextField("Name",text: $name);
                TextField("Pieces",text: $pieces);
                TextField("IDA",text: $ida);
                
            }.padding().scrollContentBackground(.hidden)
            
            Button("Buy") {
                
                if (name != "") {
                    message = "Creando Cuenta"
                    //NavigationLink(destination: PerfilView(), label: {Text("ir a la ventana del perfil")}).padding()
                } else {
                    message = "Uno o mas campos vacios o contraseña erronea"
                }
                showAlert = true
                
            }.padding()
                .alert(isPresented: $showAlert){
                    Alert(title: Text("Hola"),
                          message: Text(message))
                }
        }
    }
}

struct Purchase_Previews: PreviewProvider {
    static var previews: some View {
        Purchase()
    }
}
