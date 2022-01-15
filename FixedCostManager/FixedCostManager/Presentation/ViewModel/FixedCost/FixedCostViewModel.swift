//
//  FixedCostViewModel.swift
//  FixedCostManager
//
//  Created by youtaMorisaki on 2022/01/04.
//

import Foundation

class FixedCostViewModel: ObservableObject,Identifiable{
    let usecase:FixedCostUsecase
    
    @Published var fixedCosts:[FixedCost] = []
    @Published var showingRegistrationView = false
    
    init(){
        self.usecase = FixedCostUsecase()
    }
    
    // 固定費一覧を読み込む
    func load(){
        fixedCosts = usecase.load()
    }
    
    // 登録画面を表示する
    func showRegistrationView(){
        self.showingRegistrationView.toggle()
    }
}
