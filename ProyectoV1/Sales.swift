//
//  Sales.swift
//  ProyectoV1
//
//  Created by ISSC_611_2023 on 24/04/23.
//

import SwiftUI
import Combine

struct Sales: View {
    @State private var idproduct = ""
    @State private var name = ""
    @State private var quantity = ""
    @State private var idv = ""
    @State private var idc = ""
    @State private var pieces = ""
    @State private var subtotal = ""
    @State private var total = ""
    @State private var mess = ""
    @State private var mostrarAlerta = false
    var body: some View {
            VStack{
                Text("Sales").font(.largeTitle).padding()
                
                    Component_TextField(textFieldTitle: "IdProduct", textFieldText: $idproduct)
                        .keyboardType(.numberPad)
                        .onReceive(Just(idproduct)){
                        value in
                        let filtered = "\(value)".filter { "0123456789".contains($0) }
                        if filtered != value {
                            self.idproduct = "\(filtered)"
                        }
                        };
                    Component_TextField(textFieldTitle: "Name", textFieldText: $name)
                    Component_TextField(textFieldTitle: "Quantity", textFieldText: $quantity)
                        .keyboardType(.numberPad)
                        .onReceive(Just(quantity)){
                        value in
                        let filtered = "\(value)".filter { "0123456789".contains($0) }
                        if filtered != value {
                            self.quantity = "\(filtered)"
                        }
                        };
                    Component_TextField(textFieldTitle: "IdV", textFieldText: $idv)
                        .keyboardType(.numberPad)
                        .onReceive(Just(idv)){
                        value in
                        let filtered = "\(value)".filter { "0123456789".contains($0) }
                        if filtered != value {
                            self.idv = "\(filtered)"
                        }
                        };
                    Component_TextField(textFieldTitle: "IdC", textFieldText: $idc)
                        .keyboardType(.numberPad)
                        .onReceive(Just(idc)){
                        value in
                        let filtered = "\(value)".filter { "0123456789".contains($0) }
                        if filtered != value {
                            self.idc = "\(filtered)"
                        }
                        };
                    Component_TextField(textFieldTitle: "Pieces", textFieldText: $pieces)
                        .keyboardType(.numberPad)
                        .onReceive(Just(pieces)){
                        value in
                        let filtered = "\(value)".filter { "0123456789".contains($0) }
                        if filtered != value {
                            self.pieces = "\(filtered)"
                        }
                        };
                    Component_TextField(textFieldTitle: "Subtotal", textFieldText: $subtotal)
                        .keyboardType(.numberPad)
                        .onReceive(Just(subtotal)){
                        value in
                        let filtered = "\(value)".filter { "0123456789".contains($0) }
                        if filtered != value {
                            self.subtotal = "\(filtered)"
                        }
                        };
                    Component_TextField(textFieldTitle: "Total", textFieldText: $total)
                        .keyboardType(.numberPad)
                        .onReceive(Just(total)){
                        value in
                        let filtered = "\(value)".filter { "0123456789".contains($0) }
                        if filtered != value {
                            self.total = "\(filtered)"
                        }
                        };
                
                Button("Generate Sale"){
                    mostrarAlerta = false
                    
                    if (idproduct == "" || name == "" || quantity == "" || idv == "" || idc == "" || pieces == "" || subtotal == "" || total == ""){
                        idproduct = ""
                        name = ""
                        quantity = ""
                        idv = ""
                        idc = ""
                        pieces = ""
                        subtotal = ""
                        total = ""
                        
                        mess = "At least one field is empty"
                        mostrarAlerta = true
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



struct Sales_Previews: PreviewProvider {
    static var previews: some View {
        Sales()
    }
}
