//
//  FixedCostUsecase.swift
//  FixedCostManager
//
//  Created by youtaMorisaki on 2022/01/10.
//

import Foundation

struct FixedCostUsecase{
    let repository:FixedCostRepository
    
    init(){
        self.repository = FixedCostRepository()
    }
    
    func load() -> [FixedCost]{
        return repository.read()
    }
    
    func register(name:String, cost:Int){
        repository.create(name: name, cost: cost)
    }
    
    func update(id:UUID, name:String, cost:Int){
        repository.update(id: id, name: name, cost: cost)
    }
}
