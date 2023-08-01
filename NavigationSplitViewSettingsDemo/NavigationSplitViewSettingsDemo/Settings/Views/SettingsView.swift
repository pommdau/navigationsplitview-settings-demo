//
//  SettingsView.swift
//  NavigationSplitViewSettingsDemo
//
//  Created by HIROKI IKEUCHI on 2023/08/01.
//

import SwiftUI

struct SettingsView: View {
    
    // 前回開いた設定を覚えておき再度それを開く
    @AppStorage("selected-settings-pane") private var selectedSettingsPane: SettingsPaneType = .general
    
    private var window: NSWindow? {
        NSApp.windows.first(where: { window in
            window.identifier?.rawValue == "com_apple_SwiftUI_Settings_window"
        })
    }
    
    var body: some View {
        NavigationSplitView(columnVisibility: .constant(.all)) {
            List(SettingsPaneType.allCases, id: \.self, selection: $selectedSettingsPane) { settingsPane in
                NavigationLink(value: settingsPane) {
                    settingsLabel(settingsPane)
                }
            }
            .toolbar(.hidden, for: .windowToolbar)  // サイドバーの表示/非表示ボタンを隠す
        } detail: {
            switch selectedSettingsPane {
            case .general:
                GeneralSettingsView()
            case .advanced:
                GeneralSettingsView()
//                AdvancedSettingsView()
            }
        }
        .onExitCommand {  // esc押下時に設定ウインドウを閉じる
            window?.close()
        }
    }
    
    @ViewBuilder
    private func settingsLabel(_ settingsPane: SettingsPaneType) -> some View {
        Label {
            Text(settingsPane.title)
                .font(.body)
        } icon: {
            settingsPane.icon
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 16, height: 16)
                .padding(2)
                .foregroundColor(.white)
                .background(Color(nsColor: .lightGray))
                .cornerRadius(4)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environmentObject(GeneralSettings())
            .environmentObject(AdvancedSettings())
    }
}
