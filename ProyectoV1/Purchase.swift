//
//  Purchase.swift
//  ProyectoV1
//
//  Created by ISSC_611_2023 on 24/04/23.
//

import SwiftUI
import Combine

struct Purchase: View {
    @State private var idProduct = ""
    @State private var name = ""
    @State private var pieces = ""
    @State private var ida = ""
    @State private var showAlert = false;
    
    @State private var title = "";
    @State private var message = "";
    
    
    
    var body: some View {
        NavigationView{
            VStack{
                Text("Purchase").font(.largeTitle).padding()

                    //id
                    Component_TextField(textFieldTitle: "IdProduct", textFieldText: $idProduct)
                    .keyboardType(.numberPad)
                    .onReceive(Just(idProduct)){
                    value in
                    let filtered = "\(value)".filter { "0123456789".contains($0) }
                    if filtered != value {
                        self.idProduct = "\(filtered)"
                    }
                    };
                    //name
                    Component_TextField(textFieldTitle: "Name", textFieldText: $name)
                    //pieces
                    Component_TextField(textFieldTitle: "Pieces", textFieldText: $pieces)
                    .keyboardType(.numberPad)
                    .onReceive(Just(pieces)){
                    value in
                    let filtered = "\(value)".filter { "0123456789".contains($0) }
                    if filtered != value {
                        self.pieces = "\(filtered)"
                    }
                    };
                    //ida
                    Component_TextField(textFieldTitle: "IDA", textFieldText: $ida)
                    .keyboardType(.numberPad)
                    .onReceive(Just(ida)){
                    value in
                    let filtered = "\(value)".filter { "0123456789".contains($0) }
                    if filtered != value {
                        self.ida = "\(filtered)"
                    }
                    };

                
                Button("Buy") {
                    validateFields()
                    showAlert = true

                    
                }.padding()
                    .alert(isPresented: $showAlert){
                        Alert(title: Text(title),
                              message: Text(message))}
                NavigationLink(destination: Menu(),
                label: {
                    Text("Back to Menu")
                })
            }
        }
    }
    
    func validateFields(){
        if([idProduct, name, pieces, ida].contains("")){
            title = "Error"
            message = "One or more fields are empty"
        }else{
            clean()
            title="Success"
            message="The fields were saved succesfully"
        }
    }

    func clean(){
        idProduct=""
        name=""
        pieces=""
        ida=""
    }
    
}



struct Purchase_Previews: PreviewProvider {
    static var previews: some View {
        Purchase()
    }
}
