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

    init(id:UUID=UUID(),title:String){
        self.id = id
        self.title = title
      
    }
}
