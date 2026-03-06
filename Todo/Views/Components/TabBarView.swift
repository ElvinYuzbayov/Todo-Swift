import SwiftUI

struct TabBarView: View {
    @State private var vm = TodoViewModel()
  
   enum Tab:Hashable{
        case todos,add,settings
    }
    
    @State private var selectedTab:Tab = .todos
    @State private var previousTab:Tab = .todos
    @State private var isAddPresented = false
    
    var body: some View {
        
        TabView(selection:$selectedTab){
            
            NavigationStack{
                TodoView(vm:vm)
             }.tabItem{
            Label("todos",systemImage: "checklist")
            }.tag(Tab.todos)
            
            Color.clear.tabItem{
                Label("add_todo",systemImage:"plus")
            }.tag(Tab.add)
           
            NavigationStack{
                SettingsView(vm:vm)
            }.tabItem{
                Label("settings",systemImage:"gearshape")
            }.tag(Tab.settings)
           
        }.onChange(of:selectedTab){
            if selectedTab == .add{
                selectedTab = previousTab
                isAddPresented = true
            }else{
                previousTab = selectedTab
            }
        }.sheet(isPresented:$isAddPresented){
            NavigationStack{
                AddTodoView(vm:vm).navigationTitle("add_todo")
                    .toolbar{
                     
                        ToolbarItem(placement:.topBarTrailing){
                            Button("done"){isAddPresented = false}
                        }
                    }
            }.presentationDetents([.medium,.large])
        }
    }
}

#Preview {
    TabBarView()
}
