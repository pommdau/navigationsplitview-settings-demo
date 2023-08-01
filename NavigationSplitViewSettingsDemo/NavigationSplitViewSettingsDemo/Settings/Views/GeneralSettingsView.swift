//
//  GeneralSettingsView.swift
//  NavigationSplitViewSettingsDemo
//
//  Created by HIROKI IKEUCHI on 2023/08/01.
//

import SwiftUI

struct GeneralSettingsView: View {
    
    @EnvironmentObject var generalSettings: GeneralSettings
    
    var body: some View {
        VStack {
            Form {
                Section {
                    ColorPicker(selection: $generalSettings.shapeColor.animation()) {
                        Text("Color")
                    }
                    
                    Slider(
                        value: $generalSettings.shapeSize.animation(),
                        in: 0...100,
                        step: 10
                    ) {
                        Text("Size")
                    } minimumValueLabel: {
                        Text("0")
                    } maximumValueLabel: {
                        Text("100")
                    }
                    
                    Toggle(isOn: $generalSettings.needsShapeShadow.animation()) {
                        Text("Add Shadow")
                    }
                } header: {
                    Text("Appearance")
                }
            }
            .formStyle(.grouped)
        }
        .navigationTitle(generalSettings.settingsPaneType.title)
    }
}

struct GeneralSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        GeneralSettingsView()
            .environmentObject(GeneralSettings())
    }
}
