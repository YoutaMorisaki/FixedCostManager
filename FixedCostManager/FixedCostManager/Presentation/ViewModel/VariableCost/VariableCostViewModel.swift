//
//  VariableCostViewModel.swift
//  FixedCostManager
//
//  Created by youtaMorisaki on 2022/01/04.
//

import Foundation

class VariableCostViewModel: ObservableObject,Identifiable{
    let usecase:VariableCostUsecase
    
    @Published var year:Int
    @Published var month:Int
    @Published var variableCosts:[VariableCost] = []
    @Published var monthlyCharges:[MonthlyCharge] = []
    @Published var showingRegistrationView = false
    @Published var selectionMonth = 0
    
    let calendar = Calendar(identifier: .gregorian)
    var date = Date()
    let months:[Int] = [1,2,3,4,5,6,7,8,9,10,11,12]
    
    init(){
        // 現在の日付（年、月）を取得
        year = calendar.component(.year, from: date)
        month = calendar.component(.month, from: date)
        usecase = VariableCostUsecase()
    }
    
    // 変動費一覧を読み込む
    func load(){
        variableCosts = usecase.loadVariableCosts()
        monthlyCharges = usecase.loadMonthlyCharges()
    }
    
    func changeMonth(selection:Int){
        month = months[selection]
    }
    
    // 登録画面を表示する
    func showRegistrationView(){
        self.showingRegistrationView.toggle()
    }
    
    func selectMonth(index:Int){
        selectionMonth = index
    }
    
    func getSelectedMonthlyCharge(variableCostId:UUID) -> MonthlyCharge{
        let target = monthlyCharges
            .filter({$0.variableCostId == variableCostId})
            .filter({$0.year == year})
            .filter({$0.month == month})
            .first
        
        if target != nil{
            return target!
        }
        else{
            return MonthlyCharge(id: UUID(), cost: 0, year: year, month: month, variableCostId: variableCostId)
        }
    }
    
    func getMonthlyCostId(variableCostId:UUID) -> UUID{
        let monthlyCost = self.monthlyCharges.filter({$0.variableCostId == variableCostId})

        if(monthlyCost.count > 0){
            let target = monthlyCost.filter({$0.year == year}).filter({$0.month == month})
            if target.isEmpty{
                return UUID()
            }
            else{
                return target[0].id
            }
        }
        else{
            return UUID()
        }
    }
    
    func getCost(variableCostId:UUID) -> Int{
        return usecase.getCost(variableCostId: variableCostId, year: year, month: month)
    }
}
