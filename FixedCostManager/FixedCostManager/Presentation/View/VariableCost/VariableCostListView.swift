//
//  VariableCostListView.swift
//  FixedCostManager
//
//  Created by youtaMorisaki on 2022/01/04.
//

import SwiftUI

struct VariableCostListView: View {
    @ObservedObject var vm:VariableCostViewModel = VariableCostViewModel()
    
    init(){
        vm.load()
    }
    
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    Text("\(vm.year)年")
                    ScrollView(.horizontal, showsIndicators: false) {
                        ScrollViewReader { proxy in
                            HStack {
                                ForEach(0..<vm.months.count) { num in
                                    MonthTabItem(isSelected: false, name: "\(vm.months[num])月")
                                        .padding(.init(top: 4, leading: 8, bottom: 4, trailing: 8))
                                        .id(num)
                                        .onTapGesture(perform: {
                                            withAnimation {
                                                vm.selectMonth(index: num)
                                            }
                                        })
                                }
                            }
                            .onChange(of: vm.selectionMonth, perform: { index in
                                withAnimation {
                                    proxy.scrollTo(index, anchor: .center)
                                    vm.changeMonth(selection:index)
                                }
                            })
                        }
                    }
                    
                    TabView(selection: $vm.selectionMonth) {
                        ForEach(0..<vm.months.count) { num in
                            List() {
                                ForEach(vm.variableCosts, id: \.id) { variableCost in
                                    NavigationLink(destination: VariableCostDetailView(monthlyCharge: vm.getSelectedMonthlyCharge(variableCostId:variableCost.id)))
                                    {
                                        CostRowView(name:variableCost.name, cost:vm.getCost(variableCostId: variableCost.id))
                                    }
                                }
                            }
                            .tag(num)
                        }
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
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
                        VariableItemRegistrationView()
                    }
                }
            }.navigationBarTitle("変動費", displayMode: .inline)
        }
    }
}

struct VariableCostListView_Previews: PreviewProvider {
    static var previews: some View {
        VariableCostListView()
    }
}
