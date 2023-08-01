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
