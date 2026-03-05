//
//  TodoApp.swift
//  Todo
//
//  Created by Elvın Yuzbayov on 2026-02-19.
//

import SwiftUI

@main
struct TodoApp: App {
    @AppStorage("appTheme") private var appTheme:AppTheme = .system
    init(){
        NotificationManager.shared.requestAuthorization()
    }
    var body: some Scene {
        WindowGroup {
         
            TabBarView().preferredColorScheme(appTheme.colorScheme)
        }
    }
}
