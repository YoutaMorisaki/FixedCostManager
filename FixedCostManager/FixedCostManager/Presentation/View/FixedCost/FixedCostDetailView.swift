//
//  FixedCostDetailView.swift
//  FixedCostManager
//
//  Created by youtaMorisaki on 2022/01/09.
//

import SwiftUI

struct FixedCostDetailView: View {
    @ObservedObject var vm:FixedCostDetailViewModel
    @Environment(\.presentationMode) var presentationMode
    
    init(fixedCost:FixedCost,vm:FixedCostDetailViewModel = FixedCostDetailViewModel()){
        self.vm = vm
        vm.setFixedCost(fixedCost: fixedCost)
    }
    
    var body: some View {
            Form {
                Section{
                    TextField("", text: $vm.name)
                        .onAppear(perform: {
                            vm.name = vm.fixedCost!.name
                        })
                } header:{
                    Text("名前")
                }
                
                Section{
                    TextField("", text: $vm.cost)
                        .keyboardType(.numberPad)
                        .onAppear(perform: {
                            vm.cost = String(vm.fixedCost!.cost)
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
