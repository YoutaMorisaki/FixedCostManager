//
//  FixedCostDetailViewModel.swift
//  FixedCostManager
//
//  Created by youtaMorisaki on 2022/01/10.
//

import Foundation

class FixedCostDetailViewModel: ObservableObject,Identifiable{
    @Published var name = ""
    @Published var cost = ""
    var fixedCost:FixedCost?
    
    let useCase:FixedCostUsecase
    
    init(){
        self.useCase = FixedCostUsecase()
    }
    
    func setFixedCost(fixedCost:FixedCost){
        self.fixedCost = fixedCost
    }
    
    // 更新
    func update(){
        // TODO !をなんとかしたい　↓
        useCase.update(id: fixedCost!.id, name: name, cost: Int(cost)!)
    }
}
