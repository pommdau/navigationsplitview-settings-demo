//
//  ContentView.swift
//  NavigationSplitViewSettingsDemo
//
//  Created by HIROKI IKEUCHI on 2023/08/01.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject private var generalSettings: GeneralSettings
    @EnvironmentObject private var advancedSettings: AdvancedSettings
    
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .stroke(lineWidth: 1)
                    .foregroundColor(.secondary)
                    .frame(width: 140, height: 140)
                shape()
                    .foregroundColor(generalSettings.shapeColor)
                    .frame(width: CGFloat(generalSettings.shapeSize),
                           height: CGFloat(generalSettings.shapeSize))
                    .shadow(color: generalSettings.needsShapeShadow ? .black : .clear, radius: 4, x: 0, y: 8)
            }
            .padding(.bottom, 20)

            Text(advancedSettings.message)
                .frame(width: 200)
            
            // for Debugging
            Button("Reset Userdefaults and quit.") {
                GeneralSettings.resetUserDefaults()
                AdvancedSettings.resetUserDefaults()
                NSApp.terminate(self)
            }
            .padding(.top, 40)
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
