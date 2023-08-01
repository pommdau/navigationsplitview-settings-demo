//
//  AdvancedSettings.swift
//  NavigationSplitViewSettingsDemo
//
//  Created by HIROKI IKEUCHI on 2023/08/01.
//

import SwiftUI

class AdvancedSettings: ObservableObject {
    
    let settingsPaneType: SettingsPaneType = .advanced
//    UserDefaults.standard.getEnum(forKey: "shape-type") ?? .circle
    @Published var shapeType: ShapeType = UserDefaults.standard.getEnum(forKey: "shape-type") ?? .circle {
        didSet {
            UserDefaults.standard.set(shapeType, forKey: "shape-type")
        }
    }
    
    @Published var sampleMessage: String = UserDefaults.standard.string(forKey: "sample-message") ?? "Lorem ipsum dolor sit amet" {
        didSet {
            UserDefaults.standard.set(sampleMessage, forKey: "sample-message")
        }
    }
}

extension AdvancedSettings {
    enum ShapeType: String {
        case rectangle
        case circle
        
        var shape: any Shape {
            switch self {
            case .rectangle:
                return Rectangle()
            case .circle:
                return Circle()
            }
        }
    }
}

extension UserDefaults {

    func setEnum<T: RawRepresentable>(_ value: T?, forKey key: String) where T.RawValue == String {
        if let value = value {
            set(value.rawValue, forKey: key)
        } else {
            removeObject(forKey: key)
        }
    }

    func getEnum<T: RawRepresentable>(forKey key: String) -> T? where T.RawValue == String {
        if let string = string(forKey: key) {
            return T(rawValue: string)
        }
        return nil
    }
}
