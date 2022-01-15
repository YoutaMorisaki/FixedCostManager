//
//  HomeView.swift
//  FixedCostManager
//
//  Created by youtaMorisaki on 2022/01/15.
//

import SwiftUI

struct MonthTabItem: View{
    let isSelected: Bool
    let name:String
    
    var body: some View{
        if isSelected {
            Text(name)
                .foregroundColor(.white)
                .background(Color.blue)
                .clipShape(Capsule())
        } else {
            Text(name)
                .foregroundColor(Color(.label))
        }
       
    }
}

struct HomeView: View {
    @ObservedObject var vm: HomeViewModel
    
    init(){
        vm = HomeViewModel()
    }
    
    var body: some View {
        NavigationView{
            VStack{
                Text(String(vm.year) + "年")
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
                                vm.changeMonth(selection: index)
                            }
                        })
                    }
                }
                
                TabView(selection: $vm.selectionMonth) {
                    ForEach(0..<vm.months.count) { num in
                        ZStack {
                            Text("¥\(vm.getTotalCost())")
                        }
                        .tag(num)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            }
            .navigationBarTitle("ホーム", displayMode: .inline)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
