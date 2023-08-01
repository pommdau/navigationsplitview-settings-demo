//
//  NavigationSplitViewSettingsDemoApp.swift
//  NavigationSplitViewSettingsDemo
//
//  Created by HIROKI IKEUCHI on 2023/08/01.
//

import SwiftUI

@main
struct NavigationSplitViewSettingsDemoApp: App {
    
    private var generalSettings = GeneralSettings()
    private var advancedSettings = AdvancedSettings()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .frame(minWidth: 600, maxWidth: 600, minHeight: 400, maxHeight: 400)
                .environmentObject(generalSettings)
                .environmentObject(advancedSettings)
        }
        .windowResizability(.contentSize)  // ウインドウのサイズを固定
        
        Settings {
            SettingsView()
                .environmentObject(generalSettings)
                .environmentObject(advancedSettings)
        }
    }
}
