//
//  ContentView.swift
//  NavigationSplitViewSettingsDemo
//
//  Created by HIROKI IKEUCHI on 2023/08/01.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var generalSettings: GeneralSettings
    @EnvironmentObject var advancedSettings: AdvancedSettings
    
    var body: some View {
        VStack {
            shape()
                .foregroundColor(generalSettings.shapeColor)
                .frame(width: CGFloat(generalSettings.shapeSize), height: CGFloat(generalSettings.shapeSize))
                .shadow(color: generalSettings.needsShapeShadow ? .black : .clear, radius: 10, x: 0, y: 10)
                .padding(.bottom, 20)
            Text(advancedSettings.sampleMessage)
                .frame(width: 200)
        }
        .padding()
    }
    
    @ViewBuilder
    private func shape() -> some View {
        switch advancedSettings.shapeType {
        case .circle:
            Circle()
        case .rectangle:
            Rectangle()
        }        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(GeneralSettings())
            .environmentObject(AdvancedSettings())
    }
}
