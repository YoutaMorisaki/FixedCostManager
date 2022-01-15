//
//  HomeUsecase.swift
//  FixedCostManager
//
//  Created by youtaMorisaki on 2022/01/12.
//

import Foundation

struct HomeUseCase{
    let fixedCostRepository:FixedCostRepository
    let monthlyChargeRepository:MonthlyChargeRepository
    
    
    init(){
        self.fixedCostRepository = FixedCostRepository()
        self.monthlyChargeRepository = MonthlyChargeRepository()
    }
    
    func load() -> [Int:Int]{
        // 固定費の合計を計算する
        var fixedCostTotalCost = 0
        let fixedCosts = fixedCostRepository.read()
        for i in 0..<fixedCosts.count {
            fixedCostTotalCost += fixedCosts[i].cost
        }
        
        // 月ごとの変動費を計算する
        let monthlyCosts = monthlyChargeRepository.read()
        var monthToTotalCost:[Int:Int] = [:]
        // TODO ネストを改善したい
        for month in 1...12 {
            var monthlyChargeTotalCost = 0
            for i in 0..<monthlyCosts.count {
                if monthlyCosts[i].month == month{
                    monthlyChargeTotalCost += monthlyCosts[i].cost
                }
            }
            monthToTotalCost.updateValue(fixedCostTotalCost + monthlyChargeTotalCost, forKey: month)
        }
        
        return monthToTotalCost
    }
}
