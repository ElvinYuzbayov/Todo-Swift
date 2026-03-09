//
//  FilterSheetView.swift
//  Todo
//
//  Created by Elvın Yuzbayov on 2026-02-23.
//

import SwiftUI
struct FilterSheetView: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var selectedCategory: TodoCategory?
    
    var body: some View {
        NavigationStack {
            Form {
                Picker("category", selection: $selectedCategory) {
                    Text("all").tag(TodoCategory?.none)     // nil
                    ForEach(TodoCategory.allCases, id: \.self) { cat in
                        Text(cat.rawValue).tag(Optional(cat)) // TodoCategory?
                    }
                }
            }
            
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("done") { dismiss() }
                }
            }
        }
    }
}
#Preview {
    PreviewWrapper()
}

private struct PreviewWrapper : View{
    @State var category:TodoCategory? = nil
    var body : some View{
        FilterSheetView(selectedCategory:$category)
    }
}
