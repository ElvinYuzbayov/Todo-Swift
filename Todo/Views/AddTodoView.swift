//
//  AddTodoView.swift
//  Todo
//
//  Created by Elvın Yuzbayov on 2026-02-26.
//

import SwiftUI

struct AddTodoView: View {
    @Bindable var vm:TodoViewModel
    
    var body: some View {
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
    }
}

#Preview {
    AddTodoView(vm:TodoViewModel())
}
