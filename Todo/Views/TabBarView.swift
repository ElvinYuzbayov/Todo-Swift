//
//  TabBarView.swift
//  Todo
//
//  Created by Elvın Yuzbayov on 2026-02-19.
//

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
                    .navigationTitle("Todos")
            }.tabItem{
            Label("Todos",systemImage: "checklist")
            }.tag(Tab.todos)
            
            Color.clear.tabItem{
                Label("Add task",systemImage:"plus")
            }.tag(Tab.add)
           
            NavigationStack{
                SettingsView()
            }.tabItem{
                Label("Setting",systemImage:"gearshape")
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
                AddTodoView(vm:vm).navigationTitle("Add todo")
                    .toolbar{
                     
                        ToolbarItem(placement:.topBarTrailing){
                            Button("Done"){isAddPresented = false}
                        }
                    }
            }.presentationDetents([.medium,.large])
        }
    }
}

#Preview {
    TabBarView()
}
