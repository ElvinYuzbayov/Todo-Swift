//
//  TabBarView.swift
//  Todo
//
//  Created by Elvın Yuzbayov on 2026-02-19.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView{
            NavigationStack{
                TodoView()
            }.tabItem{
                Label("Todos",systemImage:"checklist")
            }
            NavigationStack{
                SettingsView()
            }.tabItem{
                Label("Setting",systemImage:"gearshape")
            }
        }
    }
}

#Preview {
    TabBarView()
}
