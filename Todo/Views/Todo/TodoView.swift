import SwiftUI

struct TodoView: View {
    @State var searchText = ""
    @State var isFilteredSheetPresented = false
    @State var selectedFilteredCategory: TodoCategory? = nil
    @Bindable var vm: TodoViewModel

    var visibleTodos: [Todo] {
        guard let c = selectedFilteredCategory else { return vm.todos }
        return vm.todos.filter { $0.category == c }
    }

    var filteredTodos: [Todo] {
        guard !searchText.isEmpty else { return visibleTodos }
        return visibleTodos.filter { $0.title.localizedCaseInsensitiveContains(searchText) }
    }

    var body: some View {
        List {
            ForEach(filteredTodos) { todo in
                HStack {
                    Button {
                        withAnimation { vm.completed(id: todo.id) }
                    } label: {
                        Image(systemName: todo.completed ? "checkmark.circle.fill" : "circle")
                            .font(.title3)
                    }
                    .buttonStyle(.plain)

                    NavigationLink(value: todo.id) {
                        HStack {
                            Text(todo.title)
                            Spacer()
                            Text(todo.category.rawValue)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                .listRowBackground(todo.completed ? Color.green.opacity(0.1) : Color.gray.opacity(0.1))
            }
            .onDelete { offsets in
                let ids = offsets.map { filteredTodos[$0].id }
                vm.deleteTodo(with: ids)
            }
        }
        .overlay {
            if visibleTodos.isEmpty {
                VStack {
                    Image("emptyTodo")
                    Text("what_do_you_want_to_do_today").font(.title2)
                    Text("tap_to_add_your_tasks").font(.title3)
                }
            }
        }
        .searchable(text: $searchText, prompt: "search_your_task")
        .navigationDestination(for: UUID.self) { id in
            if vm.todos.contains(where: { $0.id == id }) {
                TodoDetail(todoId: id, vm: vm)
            } else {
                Text("todo_not_found")
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button { isFilteredSheetPresented = true } label: {
                    Image(systemName: "line.3.horizontal.decrease.circle")
                }
            }
        }
        .sheet(isPresented: $isFilteredSheetPresented) {
            FilterSheetView(selectedCategory: $selectedFilteredCategory)
                .presentationDetents([.medium, .large])
        }
    }
}
#Preview {
    TodoView(vm:TodoViewModel())
}
