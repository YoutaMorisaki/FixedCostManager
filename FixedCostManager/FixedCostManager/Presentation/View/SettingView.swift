//
//  SettingView.swift
//  FixedCostManager
//
//  Created by youtaMorisaki on 2022/01/03.
//

import SwiftUI

struct SettingView: View {
    @ObservedObject var settingVM: SettingViewModel = SettingViewModel()
     @EnvironmentObject var shareData:ShareData
     @State var themaColorSelection:Int = 0
     
     var body: some View {
         NavigationView {
             Form {
                 Section {
//                     Picker(selection: $themaColorSelection, label: Text("テーマカラー")) {
//                         ForEach(0..<shareData.themaColorList.count) { index in
//                             Text(shareData.themaColorNameList[index])
//                         }
//                     }
//                     .onChange(of: themaColorSelection) { _ in
//                         shareData.setting.themaColor = themaColorSelection
//                         settingVM.changeTargetSteps(setting: shareData.setting)
//                     }
                 } header: {
                     Text("設定")
                 }
             }.navigationBarTitle("設定", displayMode: .inline)
         }.onAppear(){
             themaColorSelection = shareData.setting.themaColor
         }
     }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
