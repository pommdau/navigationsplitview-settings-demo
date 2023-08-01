//
//  AdvancedSettings.swift
//  NavigationSplitViewSettingsDemo
//
//  Created by HIROKI IKEUCHI on 2023/08/01.
//

import SwiftUI

class AdvancedSettings: ObservableObject {
    
    let settingsPaneType: SettingsPaneType = .advanced

    @Published var sampleMessage: String = UserDefaults.standard.string(forKey: "sample-message") ?? "このあのイーハトーヴォのすきとおった風" {
        didSet {
            UserDefaults.standard.set(sampleMessage, forKey: "sample-message")
        }
    }
}
