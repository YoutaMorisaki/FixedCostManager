//
//  VariableVostDetailViewModel.swift
//  FixedCostManager
//
//  Created by youtaMorisaki on 2022/01/10.
//

import Foundation

class VariableVostDetailViewModel: ObservableObject,Identifiable{
    @Published var name = ""
    @Published var cost = ""
    var monthlyCharge:MonthlyCharge
    
    let usecase:VariableCostUsecase
    
    init(monthlyCharge:MonthlyCharge){
        self.usecase = VariableCostUsecase()
        self.monthlyCharge = monthlyCharge
    }
    
    func load(){
        self.name = getName()
        self.cost = String(getCost())
    }
    
    func getCost() -> Int{
        return usecase.getCost(id: monthlyCharge.id)
    }
    
    func getName() -> String{
        return usecase.getName(id: monthlyCharge.variableCostId)
    }
    
    // 更新
    func update(){
        // 最終的に更新されたもののみにしたい
        usecase.updateVariableCost(id: monthlyCharge.variableCostId, name: name)
        
        usecase.updateMonthlyCharge(
            id: monthlyCharge.id,
            cost: Int(cost)!,
            year: monthlyCharge.year,
            month: monthlyCharge.month,
            variableCostId: monthlyCharge.variableCostId)
    }
}
