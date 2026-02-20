//
//  TodoViewModel.swift
//  Todo
//
//  Created by Elvın Yuzbayov on 2026-02-19.
//
import Observation
import Foundation

@MainActor
@Observable
final class TodoViewModel{
    var todos:[Todo] = [] 
    var newTitle:String = ""
    var selectedCategory:TodoCategory = .personal
    
    //Add todo
    func addTodo(){
        let trimmed = newTitle.trimmingCharacters(in:.whitespacesAndNewlines)
        guard !trimmed.isEmpty else {return}
        
        todos.insert(Todo(title: trimmed, category: selectedCategory),at:0)
        newTitle = ""
    }
    
    //Delete todo
    func deleteTodo(at offsets: IndexSet) {
        for index in offsets {
            todos.remove(at: index)
        }
    }
    
    
    //Completed todo
       func completed(id:UUID){
        guard let index = todos.firstIndex(where:{$0.id == id}) else {return}
        todos[index].completed.toggle()
    }

}
