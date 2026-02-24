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
    
    private let storageKey = "todos_v1"
    
    init(){
        loadTodos()
    }
    
        // CRUD
    
    //Add todo
    func addTodo(){
        let trimmed = newTitle.trimmingCharacters(in:.whitespacesAndNewlines)
        guard !trimmed.isEmpty else {return}
        
        todos.insert(Todo(title: trimmed, category: selectedCategory),at:0)
        newTitle = ""
        saveTodos()
    }
    
    //Delete todo
    func deleteTodo(with ids: [UUID]) {
        todos.removeAll{ids.contains($0.id)}
        saveTodos()
    }
    
    //Completed todo
       func completed(id:UUID){
        guard let index = todos.firstIndex(where:{$0.id == id}) else {return}
        todos[index].completed.toggle()
           saveTodos()
    }
    
    //Reminder detail
    func setReminder(todoId:UUID,date:Date?){
        guard let index = todos.firstIndex(where:{$0.id == todoId}) else {return}
        todos[index].remindAt = date
        saveTodos()
    }
    
    //Update Reminder
    func updateReminder(todoId:UUID,newDate:Date){
        setReminder(todoId:todoId,date:newDate)
        
    }
        
    
    // PERSISTENCE
    
    private func saveTodos(){
        do{
            let data = try JSONEncoder().encode(todos)
            UserDefaults.standard.set(data,forKey:storageKey)
        }catch{
            print("Save todos encode error:",error)
        }
    }
    
    private func loadTodos(){
        guard let data = UserDefaults.standard.data(forKey:storageKey) else {return}
        do{
            todos = try JSONDecoder().decode([Todo].self,from:data)
        }catch{
            print("Load todos decode error:",error)
        }
    }

}
