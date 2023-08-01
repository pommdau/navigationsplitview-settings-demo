//
//  UserDefaults+Color.swift
//  NavigationSplitViewSettingsDemo
//
//  Created by HIROKI IKEUCHI on 2023/08/01.
//

import SwiftUI

extension UserDefaults {
    
    func color(forKey defaultName: String) -> Color? {
        let jsonDecoder = JSONDecoder()
        guard let colorData = UserDefaults.standard.data(forKey: defaultName),
              let color = try? jsonDecoder.decode(Color.self, from: colorData) else {
            return nil
        }
        
        return color
    }
    
    func set(_ value: Color, forKey defaultName: String) {
        let jsonEncoder = JSONEncoder()
        guard let valueData = try? jsonEncoder.encode(value) else {
            return
        }
        UserDefaults.standard.set(valueData, forKey: defaultName)
    }
}

// Color + Codable

extension Color: Codable {
    enum CodingKeys: String, CodingKey {
        case red
        case green
        case blue
        case opacity
    }
    
    public func encode(to encoder: Encoder) throws {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var opacity: CGFloat = 0
        
        var container = encoder.container(keyedBy: CodingKeys.self)
        let nsColor = NSColor.init(self).usingColorSpace(.deviceRGB)!  // ColorSpaceは正しいか怪しい…
        nsColor.getRed(&red, green: &green, blue: &blue, alpha: &opacity)
                
        try container.encode(red, forKey: .red)
        try container.encode(green, forKey: .green)
        try container.encode(blue, forKey: .blue)
        try container.encode(opacity, forKey: .opacity)
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let red = try container.decode(Double.self, forKey: .red)
        let green = try container.decode(Double.self, forKey: .green)
        let blue = try container.decode(Double.self, forKey: .blue)
        let opacity = try container.decode(Double.self, forKey: .opacity)
        self.init(red: red, green: green, blue: blue, opacity: opacity)
    }
}
