//
//  VariableCostUsecase.swift
//  FixedCostManager
//
//  Created by youtaMorisaki on 2022/01/12.
//

import Foundation

struct VariableCostUsecase{
    let variableCostRepository:VariableCostRepository
    let monthlyChargeRepository:MonthlyChargeRepository
    
    init(){
        self.variableCostRepository = VariableCostRepository()
        self.monthlyChargeRepository = MonthlyChargeRepository()
    }
    
    func loadVariableCosts() -> [VariableCost]{
        return variableCostRepository.read()
    }
    
    func loadMonthlyCharges() -> [MonthlyCharge]{
        return monthlyChargeRepository.read()
    }
    
    func getName(id:UUID) -> String{
        return variableCostRepository.dataStore.fetch().filter({$0.id == id}).first?.name ?? ""
    }
    
    func getCost(id:UUID) -> Int{
        let monthlyCharges = monthlyChargeRepository.read()
        
        if monthlyCharges.isEmpty{
            return 0
        }
        
        let target = monthlyCharges
            .filter({$0.id == id})
        
        if target.isEmpty{
            return 0
        }
        else{
            return target.first!.cost
        }
    }
    
    func getCost(variableCostId:UUID, year:Int, month:Int) -> Int{
        let monthlyCharges = monthlyChargeRepository.read()
        
        if monthlyCharges.isEmpty{
            return 0
        }
        
        let target = monthlyCharges
            .filter({$0.variableCostId == variableCostId})
            .filter({$0.year == year})
            .filter({$0.month == month})
        
        if target.isEmpty{
            return 0
        }
        else{
            return target.first!.cost
        }
    }
    
    func register(name:String){
        variableCostRepository.create(name: name)
    }
    
    func updateMonthlyCharge(id:UUID, cost:Int, year:Int, month:Int, variableCostId:UUID){
        let item = monthlyChargeRepository.dataStore.get(id: id)
        
        if item == nil{
            monthlyChargeRepository.create(cost: cost, year: year, month: month, variableCostId: variableCostId)
        }
        else{
            monthlyChargeRepository.update(id: id, cost: cost)
        }
    }
    
    func updateVariableCost(id:UUID, name:String){
        variableCostRepository.update(id: id, name: name)
    }
}
