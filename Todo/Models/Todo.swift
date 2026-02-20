//
//  Todo.swift
//  Todo
//
//  Created by Elvın Yuzbayov on 2026-02-19.
//

import Foundation

struct Todo:Identifiable,Equatable{
var id = UUID()
var title:String
var completed:Bool = false
var category:TodoCategory

    init(id:UUID=UUID(),title:String,category:TodoCategory){
        self.id = id
        self.title = title
        self.category=category
    }
}
