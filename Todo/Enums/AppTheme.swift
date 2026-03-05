//
//  AppTheme.swift
//  Todo
//
//  Created by Elvın Yuzbayov on 2026-03-05.
//

import Foundation
import SwiftUI

enum AppTheme : String,CaseIterable,Identifiable{
    case system
    case light
    case dark
    
    var id:String {rawValue}
    
    var title:String{
        switch self{
        case .system:"System"
        case .light:"Light"
        case .dark:"Dark"
        }
    }
    
    var colorScheme:ColorScheme?{
        switch self{
        case .system: nil
        case .light: .light
        case .dark: .dark
        }
    }
    
    
}
