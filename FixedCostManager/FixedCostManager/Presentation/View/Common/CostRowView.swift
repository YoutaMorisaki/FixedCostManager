//
//  CostRowView.swift
//  FixedCostManager
//
//  Created by youtaMorisaki on 2022/01/04.
//

import SwiftUI

struct CostRowView: View {
    var name:String = ""
    var cost:Int = 0
    
    init(name:String, cost:Int){
        self.name = name
        self.cost = cost
    }
    
    var body: some View {
        HStack {
            Text(name)
                .padding(10)
            Spacer()
            Text("¥\(cost)")
        }
        .padding(10)
    }
}

struct CostRowView_Previews: PreviewProvider {
    static var previews: some View {
        CostRowView(name:"テスト", cost:500)
    }
}
