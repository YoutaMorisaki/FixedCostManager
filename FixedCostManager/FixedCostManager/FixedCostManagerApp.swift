//
//  FixedCostManagerApp.swift
//  FixedCostManager
//
//  Created by youtaMorisaki on 2022/01/03.
//

import SwiftUI

@main
struct FixedCostManagerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ShareData())
        }
    }
}
