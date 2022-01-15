//
//  MonthlyChargeRepository.swift
//  FixedCostManager
//
//  Created by youtaMorisaki on 2022/01/10.
//

import Foundation

struct MonthlyChargeRepository{
    let dataStore:MonthlyChargeCoreDataStore
    
    init(){
        self.dataStore = MonthlyChargeCoreDataStore()
    }
    
    func create(cost:Int, year:Int, month:Int, variableCostId:UUID){
        dataStore.create(id: UUID(), cost: cost, year:year, month:month, variableCostId:variableCostId)
    }
    
    func update(id:UUID, cost:Int){
        dataStore.update(id: id, cost: cost)
    }
    
    func read() -> [MonthlyCharge]{
        return dataStore.fetch().map(MonthlyCharge.init)
    }
    
    func search(id:UUID) -> MonthlyCharge?{
        return dataStore.get(id: id).map(MonthlyCharge.init)
    }
}

extension MonthlyCharge {
    init(monthlyChargeEntity: MonthlyChargeEntity) {
        self.id = monthlyChargeEntity.id
        self.cost = Int(monthlyChargeEntity.cost)
        self.year = Int(monthlyChargeEntity.year)
        self.month = Int(monthlyChargeEntity.month)
        self.variableCostId = monthlyChargeEntity.variableCostId
    }
}
