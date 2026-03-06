//
//  TodoDetail.swift
//  Todo
//
//  Created by Elvın Yuzbayov on 2026-02-23.
//

import SwiftUI

struct TodoDetail: View {
    let todoId:UUID
    @Bindable var vm:TodoViewModel
    
    var body: some View {
        if let index = vm.todos.firstIndex(where:{$0.id == todoId}){
            Form{
                Section("todo"){
                    Text(vm.todos[index].title)
                    Text(vm.todos[index].category.rawValue)
                }
                
                Section("reminder"){
                    Toggle("remind_me" ,isOn:Binding(
                        get:{vm.todos[index].remindAt != nil}, //toggle on/off
                        set:{isOn in vm.setReminder(todoId: todoId, date: isOn ? Date() : nil )} //set default time
                    ))
                }
                
                if let _ = vm.todos[index].remindAt{
                    DatePicker("time",selection: Binding(
                        get:{vm.todos[index].remindAt ?? Date()},
                        set:{newDate in vm.updateReminder(todoId: todoId, newDate: newDate )}
                    ),
                               in:Date()...,
                               displayedComponents: [.date,.hourAndMinute])
                }
                
            }
        }else{
            ContentUnavailableView("todo_not_found" ,systemImage: "exclamationmark.triangle")
        }
        
    }
}
//
//#Preview {
//    TodoDetail()
//}
