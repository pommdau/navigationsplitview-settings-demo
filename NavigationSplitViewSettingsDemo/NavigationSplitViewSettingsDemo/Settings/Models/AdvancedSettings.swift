//
//  AdvancedSettings.swift
//  NavigationSplitViewSettingsDemo
//
//  Created by HIROKI IKEUCHI on 2023/08/01.
//

import SwiftUI

class AdvancedSettings: ObservableObject {
    
    let settingsPaneType: SettingsPaneType = .advanced
    
    @Published var shapeType: ShapeType = UserDefaults.standard.enumByString(forKey: "shape-type") ?? .circle {
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
