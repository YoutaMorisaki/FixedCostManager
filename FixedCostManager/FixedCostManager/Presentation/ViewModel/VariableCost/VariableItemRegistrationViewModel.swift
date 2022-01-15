//
//  VariableItemRegistrationViewModel.swift
//  FixedCostManager
//
//  Created by youtaMorisaki on 2022/01/12.
//

import Foundation

class VariableItemRegistrationViewModel: ObservableObject,Identifiable{
    @Published var name = ""
    
    let useCase:VariableCostUsecase
    
    init(){
        self.useCase = VariableCostUsecase()
    }
    
    // 新規登録
    func register(){
        useCase.register(name: name)
    }
}
