//
//  ShareData.swift
//  FixedCostManager
//
//  Created by youtaMorisaki on 2022/01/03.
//

import Foundation

public class ShareData:ObservableObject {
    // TODO 初期値の直指定をなんとかしたい
    @Published var setting: SettingJ = SettingJ(targetSteps: 0, themaColor: 0)
    
    var settingM: SettingModel = SettingModel()
    
    // ColorがSwiftUiをインポートする必要があるのでここにおくのはよくなさそう
//    let themaColorList: [Color] = [
//        .red,
//        .green,
//        .blue,
//        .yellow,
//        .brown,
//        .orange,
//    ]
    
    let themaColorNameList: [String] = [
        "赤",
        "緑",
        "青",
        "黄色",
        "茶色",
        "オレンジ",
    ]
    
    init(){
        setting = load()
    }
    
    // TODO 戻り値いらない
    func load() -> SettingJ {
        return settingM.load()
    }
    
//    func getThemaColor() -> Color{
//        return themaColorList[setting.themaColor]
//    }
}
