//
//  MonthlyCharge.swift
//  FixedCostManager
//
//  Created by youtaMorisaki on 2022/01/10.
//

import Foundation

struct MonthlyCharge{
    var id:UUID
    var cost:Int
    var year:Int
    var month:Int
    var variableCostId:UUID
    
    init(id:UUID, cost:Int, year:Int, month:Int, variableCostId:UUID){
        self.id = id
        self.cost = cost
        self.year = year
        self.month = month
        self.variableCostId = variableCostId
    }
}
