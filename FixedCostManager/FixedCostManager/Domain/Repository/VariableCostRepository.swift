//
//  VariableCostRepository.swift
//  FixedCostManager
//
//  Created by youtaMorisaki on 2022/01/10.
//

import Foundation

struct VariableCostRepository{
    let dataStore:VariableCostCoreDataStore
    
    init(){
        self.dataStore = VariableCostCoreDataStore()
    }
    
    func create(name:String){
        dataStore.create(id: UUID(), name: name)
    }
    
    func update(id:UUID, name:String){
        dataStore.update(id: id, name: name)
    }
    
    func read() -> [VariableCost]{
        return dataStore.fetch().map(VariableCost.init)
    }
}

extension VariableCost {
    init(variableCostEntity: VariableCostEntity) {
        self.id = variableCostEntity.id
        self.name = variableCostEntity.name
    }
}
