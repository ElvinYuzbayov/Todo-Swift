import SwiftUI

struct TodoView: View {
    @State var isFilteredSheetPresented = false
    @State var selectedFilteredCategory:TodoCategory? = nil
    @Bindable var vm:TodoViewModel
    
    var visibleTodos:[Todo]{
        guard let c = selectedFilteredCategory else {return vm.todos}
        return vm.todos.filter{$0.category == c}
    }
    var body: some View {
        NavigationStack{
            VStack(){
            
            //Todo list, Toggle and Delete
                
                if visibleTodos.isEmpty{
                    VStack{
                        Image("emptyTodo")
                        Text("What do you want to do today?").font(.title2)
                        Text("Tap + to add your tasks").font(.title3)
                    }
                }else{
                    List{
                        ForEach(visibleTodos){todo in
                           HStack{
                                Button{
                                    withAnimation{
                                        vm.completed(id:todo.id)
                                    }
                                }label:{
                                    Image(systemName: todo.completed ? "checkmark.circle.fill" : "circle").font(.title3)
                                }.buttonStyle(.plain)
                                
                                NavigationLink(value:todo.id){
                                    HStack{
                                        Text(todo.title)
                                        Spacer()
                                        Text(todo.category.rawValue)
                                    }  .frame(maxWidth: .infinity, alignment: .leading)
                                }
                                
                            }.listRowBackground(todo.completed ? Color.green.opacity(0.1) : Color.gray.opacity(0.1))
                        }
                        
                        .onDelete{offsets in
                            let ids = offsets.map {visibleTodos[$0].id}
                            vm.deleteTodo(with:ids)
                        }
                    }
                }
                
             
            } .navigationDestination(for:UUID.self){id in
                if vm.todos.contains(where:{$0.id == id}){
                    TodoDetail(todoId:id,vm:vm)
                }else{
                    Text("Todo not found")
                }
            }
            
            //Toolbar
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
    TodoView(vm:TodoViewModel())
}
