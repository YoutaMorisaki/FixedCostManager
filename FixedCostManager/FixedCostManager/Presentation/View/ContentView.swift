//
//  ContentView.swift
//  FixedCostManager
//
//  Created by youtaMorisaki on 2022/01/03.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                        .font(.title)
                    Text("ホーム")
                }
            FixedCostListView()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("固定費")
                }
            VariableCostListView()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("変動費")
                }
            SettingView()
                .tabItem {
                    Image(systemName: "gearshape.fill")
                        .font(.title)
                    Text("設定")
                }
        }
        .accentColor(.green)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
