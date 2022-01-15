//
//  SettingModel.swift
//  FixedCostManager
//
//  Created by youtaMorisaki on 2022/01/03.
//

import Foundation

class SettingModel{
    
    let settingKey = "setting"
    
    // 設定を保存する
    func save(setting: SettingJ){
        let jsonEncoder = JSONEncoder()
        
        guard let data = try? jsonEncoder.encode(setting) else {
            // TODO Jsonへの変換失敗
            return
        }
        UserDefaults.standard.set(data, forKey: settingKey)
    }
    
    // 設定を読み込む
    func load() -> SettingJ {
        let jsonDecoder = JSONDecoder()
        guard let data = UserDefaults.standard.data(forKey: settingKey),
              let setting = try? jsonDecoder.decode(SettingJ.self, from: data) else {
                  return SettingJ(targetSteps: 0, themaColor: 0)
        }
        return setting
    }
}

struct SettingJ: Codable{
    var targetSteps:Int
    var themaColor:Int
    
    init(targetSteps:Int, themaColor:Int){
        self.targetSteps = targetSteps
        self.themaColor = themaColor
    }
}
