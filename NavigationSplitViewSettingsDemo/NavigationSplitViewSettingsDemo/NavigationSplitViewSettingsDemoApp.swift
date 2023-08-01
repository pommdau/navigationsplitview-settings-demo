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
                .frame(width: 600, height: 400)
                .environmentObject(generalSettings)
                .environmentObject(advancedSettings)
                .onDisappear {
                    NSApplication.shared.terminate(self)
                }
        }
        .windowResizability(.contentSize)  // ウインドウのサイズを固定
        
        Settings {
            SettingsView()
                .frame(width: 600, height: 500)
                .environmentObject(generalSettings)
                .environmentObject(advancedSettings)
        }
    }
}
