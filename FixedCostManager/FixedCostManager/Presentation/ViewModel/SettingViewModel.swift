//
//  SettingViewModel.swift
//  FixedCostManager
//
//  Created by youtaMorisaki on 2022/01/03.
//

import Foundation

final class SettingViewModel: ObservableObject,Identifiable {
    var settingM: SettingModel = SettingModel()
    
    // TODO ?を無くしない　各所でshareData!とする必要が出てしまう
    @Published var shareData:ShareData?
    
    func setShareData(shareData:ShareData){
        self.shareData = shareData
    }
    
    func changeTargetSteps(setting: SettingJ){
        settingM.save(setting: setting)
    }
    
    func loadSetting() -> Int{
         return settingM.load().targetSteps
    }
}
