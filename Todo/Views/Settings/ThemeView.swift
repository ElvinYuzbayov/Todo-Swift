//
//  ThemeView.swift
//  Todo
//
//  Created by Elvın Yuzbayov on 2026-03-05.
//

import SwiftUI

struct ThemeView: View {
    @AppStorage("appTheme") private var appTheme:AppTheme = .system
    var body: some View {
        Form{
            Section("appearance"){
                Picker("theme",selection: $appTheme){
                    ForEach(AppTheme.allCases,id:\.self){theme in Text(theme.rawValue).tag(theme)}
                }
            }
        }
        .navigationTitle("theme")
    }
}

#Preview {
    ThemeView()
}
