//
//  Sales.swift
//  ProyectoV1
//
//  Created by ISSC_611_2023 on 24/04/23.
//

import SwiftUI

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
                
                Form{
                    TextField("IdProduct", text: $idproduct)
                    TextField("Name", text: $name)
                    TextField("Quantity", text: $quantity)
                    TextField("IdV", text: $idv)
                    TextField("IdC", text: $idc)
                    TextField("Pieces", text: $pieces)
                    TextField("Subtotal", text: $subtotal)
                    TextField("Total", text: $total)
                }.padding().scrollContentBackground(.hidden)
                    
                
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
