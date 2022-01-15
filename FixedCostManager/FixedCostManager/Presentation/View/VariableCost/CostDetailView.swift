//
//  CostDetailView.swift
//  FixedCostManager
//
//  Created by youtaMorisaki on 2022/01/04.
//

import SwiftUI

struct VariableCostDetailView: View {
    @ObservedObject var vm:VariableVostDetailViewModel
    @Environment(\.presentationMode) var presentationMode
    
    init(monthlyCharge:MonthlyCharge){
        self.vm = VariableVostDetailViewModel(monthlyCharge:monthlyCharge)
        
        vm.load()
    }
    
    var body: some View {
            Form {
                Section{
                    TextField("", text: $vm.name)
                } header:{
                    Text("名前")
                }
                
                Section{
                    TextField("", text: $vm.cost)
                        .keyboardType(.numberPad)
                        .onAppear(perform: {
                        })
                    
                } header:{
                    Text("金額")
                }
            }
 
            .navigationBarItems(
                trailing: Button(action: {
                    vm.update()
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("登録").bold()
                })
    }
}
