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
                Section("Category") {
                    Picker("Category", selection: $selectedCategory) {
                        Text("All").tag(TodoCategory?.none)     // nil
                        ForEach(TodoCategory.allCases, id: \.self) { cat in
                            Text(cat.rawValue).tag(Optional(cat)) // TodoCategory?
                        }
                    }
                }
            }
            .navigationTitle("Filters")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") { dismiss() }
                }
            }
        }
    }
}
//#Preview {
//    FilterSheetView()
//}
