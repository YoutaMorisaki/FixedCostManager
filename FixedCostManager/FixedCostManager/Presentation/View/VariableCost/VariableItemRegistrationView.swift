//
//  VariableItemRegistrationView.swift
//  FixedCostManager
//
//  Created by youtaMorisaki on 2022/01/04.
//

import SwiftUI

struct VariableItemRegistrationView: View {
    @ObservedObject var vm:VariableItemRegistrationViewModel
    @Environment(\.presentationMode) var presentationMode
    
    init(){
        self.vm = VariableItemRegistrationViewModel()
    }

    var body: some View {
        NavigationView {
            Form {
                Section{
                    TextField("灯油代", text: $vm.name)
                } header:{
                    Text("名前")
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
            .navigationBarTitle("新規変動費", displayMode: .inline)
            .accentColor(.green)
        }
    }
}

struct VariableItemRegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        VariableItemRegistrationView()
    }
}
