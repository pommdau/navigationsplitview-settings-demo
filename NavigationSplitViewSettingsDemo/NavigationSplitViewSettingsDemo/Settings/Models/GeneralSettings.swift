//
//  GeneralSettings.swift
//  NavigationSplitViewSettingsDemo
//
//  Created by HIROKI IKEUCHI on 2023/08/01.
//

import SwiftUI

extension GeneralSettings {
    
    private static var className: String {
        String(describing: self)
    }
    
    enum UserDefaultsKey: String, CaseIterable {
        case shapeColor
        case shapeSize
        case needsShapeShadow
        
        // e.g. "GeneralSettings-shapeSize"
        var key: String {
            "\(className)-\(rawValue)"
        }
    }
}

class GeneralSettings: ObservableObject {
    
    let settingsPaneType: SettingsPaneType = .general

    @Published var shapeColor: Color = UserDefaults.standard.color(forKey: UserDefaultsKey.shapeColor.key) ?? .green {
        didSet {
            UserDefaults.standard.set(shapeColor, forKey: UserDefaultsKey.shapeColor.key)
        }
    }

    @Published var shapeSize: Float = UserDefaults.standard.float(forKey: UserDefaultsKey.shapeSize.key) {
        didSet {
            UserDefaults.standard.set(shapeSize, forKey: UserDefaultsKey.shapeSize.key)
        }
    }
    
    @Published var needsShapeShadow: Bool = UserDefaults.standard.bool(forKey: UserDefaultsKey.needsShapeShadow.key) {
        didSet {
            UserDefaults.standard.set(needsShapeShadow, forKey: UserDefaultsKey.needsShapeShadow.key)
        }
    }
}

extension GeneralSettings {
    // Debug用
    static func resetUserDefaults() {
        UserDefaultsKey.allCases.forEach { userDefaultsKey in
            UserDefaults.standard.removeObject(forKey: userDefaultsKey.key)
        }
    }
}
