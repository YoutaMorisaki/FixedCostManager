//
//  HomeViewModel.swift
//  FixedCostManager
//
//  Created by youtaMorisaki on 2022/01/12.
//

import Foundation

class HomeViewModel: ObservableObject,Identifiable{
    @Published var totalCosts:[Int:Int] = [:]
    
    @Published var year:Int
    @Published var month:Int
    @Published var selectionMonth = 0
    
    let calendar = Calendar(identifier: .gregorian)
    var date = Date()
    let months:[Int] = [1,2,3,4,5,6,7,8,9,10,11,12]
    
    let useCase:HomeUseCase
    
    init(){
        self.useCase = HomeUseCase()
        
        // 現在の日付（年、月）を取得
        year = calendar.component(.year, from: date)
        month = calendar.component(.month, from: date)
        
        load()
    }
    
    func load(){
        totalCosts = useCase.load()
    }
    
    func getTotalCost() -> Int{
        return totalCosts[month] ?? 0
    }
    
    func selectMonth(index:Int){
        selectionMonth = index
    }
    
    func changeMonth(selection:Int){
        month = months[selection]
    }
}
