//
//  GeneralSettings.swift
//  NavigationSplitViewSettingsDemo
//
//  Created by HIROKI IKEUCHI on 2023/08/01.
//

import SwiftUI

class GeneralSettings: ObservableObject {
    
    let settingsPaneType: SettingsPaneType = .general

    @Published var shapeColor: Color = UserDefaults.standard.color(forKey: "shape-color") ?? .green {
        didSet {
            UserDefaults.standard.set(shapeColor, forKey: "shape-color")
        }
    }

    @Published var shapeSize: Float = UserDefaults.standard.float(forKey: "shape-size") {
        didSet {
            UserDefaults.standard.set(shapeSize, forKey: "shape-size")
        }
    }
    
    @Published var needsShapeShadow: Bool = UserDefaults.standard.bool(forKey: "needs-shape-shadow") {
        didSet {
            UserDefaults.standard.set(shapeSize, forKey: "needs-shape-shadow")
        }
    }
}
