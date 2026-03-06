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
        VStack(){
            
  //          TextField
            TextField("New todo",text:$vm.newTitle).padding(.horizontal,12)
                .textFieldStyle(.roundedBorder).onSubmit {
                    vm.addTodo()
                }
          
            HStack{
                //Picker

                Menu {
                    Picker("Category", selection: $vm.selectedCategory) {
                        ForEach(TodoCategory.allCases, id: \.self) { cat in
                            Text(cat.rawValue).tag(cat)
                        }
                    }
                } label: {
                    Image(systemName: "star.fill").foregroundColor(Color(red:134/255,green:135/255,blue:231/255)).font(.system(size:30))
                        
                }
                Spacer()
                //Button
                Button{vm.addTodo()}label:{
                    Image(systemName:"arrow.right.circle.fill").foregroundColor(Color(red: 134/255, green: 135/255, blue: 231/255)).font(.system(size:34))
                }.disabled(vm.newTitle.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                
            }.padding()
            }
         
        
    }
    
}

#Preview {
    AddTodoView(vm:TodoViewModel())
}
