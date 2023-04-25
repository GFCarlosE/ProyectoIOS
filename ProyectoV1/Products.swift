//
//  Products.swift
//  ProyectoV1
//
//  Created by ISSC_611_2023 on 24/04/23.
//

import SwiftUI

struct Products: View {
    @State private var id = ""
    @State private var name = ""
    @State private var description = ""
    @State private var units = ""
    @State private var cost = ""
    @State private var price = ""
    @State private var utility = ""
    @State private var showAlert = false;
    @State private var message = "";
    var body: some View {
        VStack{
            Text("Products").font(.largeTitle).padding()

                TextField("IdProduct",text: $id);
            
                TextField("Name",text: $name);
                TextField("Pieces",text: $description);
                TextField("IDA",text: $units);
                TextField("Cost",text: $cost);
                TextField("Price",text: $price);
                TextField("Utility",text: $utility);
            
            Button("Alta") {
                
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

struct Products_Previews: PreviewProvider {
    static var previews: some View {
        Products()
    }
}
