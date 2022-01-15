//
//  FixedCostRepository.swift
//  FixedCostManager
//
//  Created by youtaMorisaki on 2022/01/10.
//

import Foundation

struct FixedCostRepository{
    let dataStore:FixedCostCoreDataStore
    
    init(){
        self.dataStore = FixedCostCoreDataStore()
    }
    
    func create(name:String, cost:Int){
        dataStore.create(id: UUID(), name: name, cost: cost)
    }
    
    func update(id:UUID, name:String, cost:Int){
        dataStore.update(id: id, name: name, cost: cost)
    }
    
    func read() -> [FixedCost]{
        return dataStore.fetch().map(FixedCost.init)
    }
}

extension FixedCost {
    init(fixedCostEntity: FixedCostEntity) {
        self.id = fixedCostEntity.id
        self.name = fixedCostEntity.name
        self.cost = Int(fixedCostEntity.cost)
    }
}
