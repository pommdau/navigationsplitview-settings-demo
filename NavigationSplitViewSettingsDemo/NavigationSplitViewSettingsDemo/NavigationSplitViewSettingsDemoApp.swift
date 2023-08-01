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
                    NSApplication.shared.terminate(self)  // メインのウインドウが閉じたときにAppを終了させる
                }
        }
        .windowResizability(.contentSize)  // ウインドウのサイズを固定
        
        Settings {
            SettingsView()
            // 縦は最小値を設定。横幅は固定。
                .frame(minHeight: 470)
                .frame(width: 720)
                .environmentObject(generalSettings)
                .environmentObject(advancedSettings)
        }
    }
}
