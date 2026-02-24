//
//  TodoView.swift
//  Todo
//
//  Created by Elvın Yuzbayov on 2026-02-19.
//

import SwiftUI

struct TodoView: View {
    @State var isFilteredSheetPresented = false
    @State var selectedFilteredCategory:TodoCategory? = nil
    
@State private var vm = TodoViewModel()
    
    var visibleTodos:[Todo]{
        guard let c = selectedFilteredCategory else {return vm.todos}
        return vm.todos.filter{$0.category == c}
    }
    var body: some View {
        NavigationStack{
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
                    ForEach(visibleTodos){todo in
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
                        let ids = offsets.map {visibleTodos[$0].id}
                        vm.deleteTodo(with:ids)
                    }
                }
             
             
            }
            .toolbar{
                 ToolbarItem(placement:.topBarTrailing){
                    Button{
                        isFilteredSheetPresented = true
                    } label:{
                        Image(systemName: "line.3.horizontal.decrease.circle")
                    }
                }
            }.sheet(isPresented:$isFilteredSheetPresented){
                FilterSheetView(selectedCategory:$selectedFilteredCategory).presentationDetents([.medium,.large])
            }
        }
       
       
    }
}

#Preview {
    TodoView()
}
