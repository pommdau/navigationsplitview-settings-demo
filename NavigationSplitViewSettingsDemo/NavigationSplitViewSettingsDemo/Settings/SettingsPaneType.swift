//
//  SettingsPaneType.swift
//  NavigationSplitViewSettingsDemo
//
//  Created by HIROKI IKEUCHI on 2023/08/01.
//

import SwiftUI

enum SettingsPaneType: Int, CaseIterable {
    case general
    case advanced
    
    var title: String {
        switch self {
        case .general:
            return "General"
        case .advanced:
            return "Advanced"
        }
    }
    
    var icon: Image {
        switch self {
        case .general:
            return Image(systemName: "gear")
        case .advanced:
            return Image(systemName: "gearshape.2")
        }
    }
}
