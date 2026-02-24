//
//  Todo.swift
//  Todo
//
//  Created by Elvın Yuzbayov on 2026-02-19.
//

import Foundation

struct Todo:Identifiable,Equatable,Codable{
var id = UUID()
var title:String
var completed:Bool = false
var category:TodoCategory
    var remindAt:Date?


    init(id:UUID=UUID(),title:String,completed:Bool = false,category:TodoCategory){
        self.id = id
        self.title = title
        self.completed = completed
        self.category=category
    }
}
