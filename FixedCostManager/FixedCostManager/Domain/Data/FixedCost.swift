//
//  FixedCost.swift
//  FixedCostManager
//
//  Created by youtaMorisaki on 2022/01/10.
//

import Foundation

struct FixedCost:Identifiable{
    var id = UUID()
    var name:String
    var cost:Int
    
    init(name:String, cost:Int){
        self.name = name
        self.cost = cost
    }
}
