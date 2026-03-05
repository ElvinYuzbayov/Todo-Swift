//
//  SettingsView.swift
//  Todo
//
//  Created by Elvın Yuzbayov on 2026-02-19.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("appTheme") private var appTheme:AppTheme = .system
    var body: some View {
        Form{
            Section("Appearance"){
                Picker("Theme",selection:$appTheme){
                    ForEach(AppTheme.allCases){theme in
                        Text(theme.title).tag(theme)
                        
                    }
                }
            }
        }
    }
}

#Preview {
    SettingsView()
}
