//
//  TodoView.swift
//  Todo
//
//  Created by Elvın Yuzbayov on 2026-02-19.
//

import SwiftUI

struct TodoView: View {
@State private var vm = TodoViewModel()
    var body: some View {
        VStack(){
            HStack(){
                //TextField
                TextField("Yeni todo",text:$vm.newTitle)
                    .textFieldStyle(.roundedBorder).onSubmit {
                    vm.addTodo()
                }
                
                //Picker
                Picker("Category",selection:$vm.selectedCategory){
                    ForEach(TodoCategory.allCases,id:\.self){cat in
                        Text(cat.rawValue).tag(cat)}
                }.pickerStyle(.menu)
                
                //Button
                Button("Yadda saxla"){vm.addTodo()}.buttonStyle(.borderedProminent).disabled(vm.newTitle.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
            
            }
            .padding()
           //Todo list, Toggle and Delete
            List{
                ForEach(vm.todos){todo in
                    HStack{
                        Image(systemName: todo.completed ? "checkmark.circle.fill" : "circle")
                        Text(todo.title)
                Spacer()
                        Text(todo.category.rawValue)
                        }.contentShape(Rectangle()).onTapGesture{
                            withAnimation{
                                vm.completed(id:todo.id)
                            }
                    }
                        .listRowBackground(todo.completed ? Color.green.opacity(0.1) : Color.gray.opacity(0.1))
                 }.onDelete{offsets in
                        vm.deleteTodo(at:offsets)}
                    
            }
         
         
        }
    }
}

#Preview {
    TodoView()
}
