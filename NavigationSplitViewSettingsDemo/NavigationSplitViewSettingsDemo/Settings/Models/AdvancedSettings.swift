//
//  AdvancedSettings.swift
//  NavigationSplitViewSettingsDemo
//
//  Created by HIROKI IKEUCHI on 2023/08/01.
//

import SwiftUI

class AdvancedSettings: ObservableObject {
    
    let settingsPaneType: SettingsPaneType = .advanced
    
    @Published var shapeType: ShapeType = UserDefaults.standard.enumByString(forKey: UserDefaultsKey.shapeType.key) ?? .circle {
        didSet {
            UserDefaults.standard.set(shapeType, forKey: UserDefaultsKey.shapeType.key)
        }
    }
    
    @Published var message: String =
    UserDefaults.standard.string(forKey: UserDefaultsKey.message.key) ?? "Press \"Command + Comma (,)\" and show settings." {
        didSet {
            UserDefaults.standard.set(message, forKey: UserDefaultsKey.message.key)
        }
    }
}

extension AdvancedSettings {
    enum ShapeType: String, CaseIterable {
        case circle
        case rectangle
        
        var title: String {
            switch self {
            case .circle:
                return "Circle"
            case .rectangle:
                return "Rectangle"
            }
        }
    }
}

// MARK: - UserDefaults

extension AdvancedSettings {
    
    private static var className: String {
        String(describing: self)
    }
    
    enum UserDefaultsKey: String, CaseIterable {
        case shapeType
        case message
        
        // e.g. "GeneralSettings-shapeSize"
        var key: String {
            "\(className)-\(rawValue)"
        }
    }
    
    // Debug用
    static func resetUserDefaults() {
        UserDefaultsKey.allCases.forEach { userDefaultsKey in
            UserDefaults.standard.removeObject(forKey: userDefaultsKey.key)
        }
    }
}
