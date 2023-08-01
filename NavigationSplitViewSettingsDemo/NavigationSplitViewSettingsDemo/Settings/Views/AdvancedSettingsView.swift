//
//  AdvancedSettingsView.swift
//  NavigationSplitViewSettingsDemo
//
//  Created by HIROKI IKEUCHI on 2023/08/01.
//

import SwiftUI

struct AdvancedSettingsView: View {
    
    @EnvironmentObject var advancedSettings: AdvancedSettings
    
    var body: some View {
        Form {
            Section {
                Picker("Shape", selection: $advancedSettings.shapeType) {
                    ForEach(AdvancedSettings.ShapeType.allCases, id: \.self) { shapeType in
                        Text(shapeType.title).tag(shapeType)
                    }
                }      
                TextField("Sample Message",
                          text: $advancedSettings.sampleMessage,
                          axis: .vertical)
            } header: {
                Text("Contents")
            }
        }
        .formStyle(.grouped)
        .navigationTitle(advancedSettings.settingsPaneType.title)
    }
}

struct AdvancedSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        AdvancedSettingsView()
            .environmentObject(AdvancedSettings())
    }
}
