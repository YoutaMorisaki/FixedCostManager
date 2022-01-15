//
//  ManagementViewModel.swift
//  FixedCostManager
//
//  Created by youtaMorisaki on 2022/01/03.
//

import Foundation

class ManagementViewModel:ObservableObject,Identifiable {
    @Published var year:Int
    @Published var month:Int
    
    let calendar = Calendar(identifier: .gregorian)
    var date = Date()
    
    let months:[Int] = [1,2,3,4,5,6,7,8,9,10,11,12]
    
    init(){
        // 現在の日付（年、月）を取得
        year = calendar.component(.year, from: date)
        month = calendar.component(.month, from: date)
    }
    
    func changeMonth(selection:Int){
        month = months[selection]
    }
}
