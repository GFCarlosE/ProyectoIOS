//
//  Products.swift
//  ProyectoV1
//
//  Created by ISSC_611_2023 on 24/04/23.
//

import SwiftUI
import Combine

struct Products: View {
    @State private var id = ""
    @State private var name = ""
    @State private var description = ""
    @State private var units = ""
    @State private var cost = ""
    @State private var price = ""
    @State private var utility = ""
    @State private var showAlert = false;
    
    @State private var title = "";
    @State private var message = "";
    
    var body: some View {
        NavigationView{
            VStack{
                Text("Products").font(.largeTitle).padding()
                
                    Component_TextField(textFieldTitle: "IdProduct", textFieldText: $id)
                    .keyboardType(.numberPad)
                    .onReceive(Just(id)){
                    value in
                    let filtered = "\(value)".filter { "0123456789".contains($0) }
                    if filtered != value {
                        self.id = "\(filtered)"
                    }
                    };
                    Component_TextField(textFieldTitle: "Name", textFieldText: $name)
                Component_TextField(textFieldTitle: "Description", textFieldText: $description)
                    //Unidades
                Component_TextField(textFieldTitle: "Units", textFieldText: $units)
                    .keyboardType(.numberPad)
                    .onReceive(Just(units)){
                    value in
                    let filtered = "\(value)".filter { "0123456789".contains($0) }
                    if filtered != value {
                        self.units = "\(filtered)"
                    }
                    };
                    //Costo
                Component_TextField(textFieldTitle: "Cost", textFieldText: $cost)
                    .keyboardType(.numberPad)
                    .onReceive(Just(cost)){
                    value in
                    let filtered = "\(value)".filter { "0123456789".contains($0) }
                    if filtered != value {
                        self.cost = "\(filtered)"
                    }
                    };
                    //Precio
                Component_TextField(textFieldTitle: "Price", textFieldText: $price)
                    .keyboardType(.numberPad)
                    .onReceive(Just(price)){
                    value in
                    let filtered = "\(value)".filter { "0123456789".contains($0) }
                    if filtered != value {
                        self.price = "\(filtered)"
                    }
                    };
                    //Utilidad
                Component_TextField(textFieldTitle: "Utility", textFieldText: $utility)
                    .keyboardType(.numberPad)
                    .onReceive(Just(utility)){
                    value in
                    let filtered = "\(value)".filter { "0123456789".contains($0) }
                    if filtered != value {
                        self.utility = "\(filtered)"
                    }
                    };
                
                
                Button("Register product") {
                    validateFields()
                    showAlert = true
                    
                    
                }.padding()
                .alert(isPresented: $showAlert){
                Alert(title: Text(title), message: Text(message))
                }
                
                NavigationLink(destination: Menu(), label: {
                    Text("Back to Menu")
                })
            }
        }
    }
    
    func validateFields(){
        if([id, name, units, cost, price, utility].contains("")){
            title = "Error"
            message = "One or more fields are empty"
        }else{
            clean()
            title="Success"
            message="The fields were saved succesfully"
        }
    }
    
    func clean(){
        id=""
        name=""
        description=""
        units=""
        cost=""
        price=""
        utility=""
    }
}

struct Products_Previews: PreviewProvider {
    static var previews: some View {
        Products()
    }
}
