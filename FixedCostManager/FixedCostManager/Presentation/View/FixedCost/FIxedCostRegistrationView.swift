//
//  FIxedCostRegistrationView.swift
//  FixedCostManager
//
//  Created by youtaMorisaki on 2022/01/10.
//

import SwiftUI

struct FIxedCostRegistrationView: View {
    @ObservedObject var vm:FixedCostRegistrationViewModel
    @Environment(\.presentationMode) var presentationMode
    
    init(vm:FixedCostRegistrationViewModel = FixedCostRegistrationViewModel()){
        self.vm = vm
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section{
                    TextField("Apple Music", text: $vm.name)
                } header:{
                    Text("名前")
                }
                
                Section{
                    TextField("500", text: $vm.cost)
                        .keyboardType(.numberPad)
                    
                } header:{
                    Text("金額")
                }
                
                Section{
                    Text("Coming Soon")
                    
                } header:{
                    Text("支払い間隔")
                }
                
                Section{
                    Text("メモ")
                    
                } header:{
                    Text("Coming Soon")
                }
            }
            .navigationBarItems(
                leading: Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("キャンセル").bold()
                }),
                trailing: Button(action: {
                    vm.register()
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("登録").bold()
                })
            .navigationBarTitle("登録", displayMode: .inline)
            .accentColor(.green)
        }
    }
}

struct FIxedCostRegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        FIxedCostRegistrationView()
    }
}
