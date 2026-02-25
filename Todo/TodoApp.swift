//
//  TodoApp.swift
//  Todo
//
//  Created by Elvın Yuzbayov on 2026-02-19.
//

import SwiftUI

@main
struct TodoApp: App {
    init(){
        NotificationManager.shared.requestAuthorization()
    }
    var body: some Scene {
        WindowGroup {
            TabBarView()
        }
    }
}
