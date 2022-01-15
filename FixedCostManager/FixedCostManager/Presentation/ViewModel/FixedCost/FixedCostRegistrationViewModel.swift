//
//  FixedCostRegistrationViewModel.swift
//  FixedCostManager
//
//  Created by youtaMorisaki on 2022/01/10.
//

import Foundation

class FixedCostRegistrationViewModel: ObservableObject,Identifiable{
    @Published var name = ""
    @Published var cost = ""
    
    let useCase:FixedCostUsecase
    
    init(){
        self.useCase = FixedCostUsecase()
    }
    
    // 新規登録
    func register(){
        // TODO !を無くしたい ↓
        useCase.register(name: name, cost: Int(cost)!)
    }
}
