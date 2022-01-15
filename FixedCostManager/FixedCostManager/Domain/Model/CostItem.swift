//
//  CostItem.swift
//  FixedCostManager
//
//  Created by 盛崎耀太 on 2022/01/05.
//

import Foundation

struct CostItem{
    var id:UUID
    var name:String
    var cost:Int
    var date:Date
    
    init(id:UUID, name:String, cost:Int, date:Date){
        self.id = id
        self.name = name
        self.cost = cost
        self.date = date
    }
}
