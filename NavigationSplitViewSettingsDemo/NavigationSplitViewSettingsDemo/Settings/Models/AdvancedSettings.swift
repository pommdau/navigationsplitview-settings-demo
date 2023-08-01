//
//  AdvancedSettings.swift
//  NavigationSplitViewSettingsDemo
//
//  Created by HIROKI IKEUCHI on 2023/08/01.
//

import SwiftUI

class AdvancedSettings: ObservableObject {
    
    let settingsPaneType: SettingsPaneType = .advanced

    @Published var shapeColor: Color = UserDefaults.standard.color(forKey: "color") ?? .black {
        didSet {
            UserDefaults.standard.set(shapeColor, forKey: "color")
        }
    }

    @Published var shapeSize: Float = UserDefaults.standard.float(forKey: "slider-value") {
        didSet {
            UserDefaults.standard.set(self.shapeSize, forKey: "slider-value")
        }
    }
}
