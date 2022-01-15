//
//  FixedCostListView.swift
//  FixedCostManager
//
//  Created by youtaMorisaki on 2022/01/03.
//

import SwiftUI

struct FixedCostListView: View {
    @ObservedObject var vm:FixedCostViewModel
    
    init(vm:FixedCostViewModel = FixedCostViewModel()){
        self.vm = vm
        self.vm.load()
    }
    
    var body: some View {
        NavigationView{
            ZStack{
                List (vm.fixedCosts) { fixedCost in
                    NavigationLink(destination: FixedCostDetailView(fixedCost: fixedCost)
                                    .onDisappear(perform: {
                        vm.load()})) {
                        CostRowView(name: fixedCost.name, cost: fixedCost.cost)
                    }
                }
                VStack{
                    Spacer()
                    
                    HStack {
                        Spacer()
                        Button(action: {
                            vm.showRegistrationView()
                        }, label: {
                            Text("+")
                                .font(.system(.largeTitle))
                                .frame(width: 77, height: 70)
                                .foregroundColor(Color.white)
                                .padding(.bottom, 7)
                        })
                            .background(Color.green)
                            .cornerRadius(100)
                            .padding()
                    }       .sheet(isPresented: $vm.showingRegistrationView) {
                        FIxedCostRegistrationView()
                            .onDisappear(perform: {
                                vm.load()
                            })
                    }
                }
            }
            .navigationBarTitle("今月の固定費", displayMode: .inline)
        }
    }
}

struct FixedCostListView_Previews: PreviewProvider {
    static var previews: some View {
        FixedCostListView()
    }
}
