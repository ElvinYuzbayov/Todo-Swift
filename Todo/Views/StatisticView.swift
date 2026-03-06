import SwiftUI

struct StatisticView: View {
    @Bindable var vm: TodoViewModel
    
    var body: some View {
        Form {
            Section("Overview") {
                Label("All todos: \(vm.allTodosCount)", systemImage: "list.bullet")
                Label("Completed: \(vm.completedTodosCount)", systemImage: "checkmark.circle")
                Label("Pending: \(vm.pendingTodosCount)", systemImage: "clock")
                
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Label("Completion progress", systemImage: "chart.bar")
                        Spacer()
                        Text("\(vm.completedPercent)%")
                            .foregroundStyle(.secondary)
                    }
                    
                    ProgressView(value: Double(vm.completedPercent), total: 100)
                }
                .padding(.top, 6)
            }
        }
        .navigationTitle("Statistics")
    }
}

#Preview {
    StatisticView(vm: TodoViewModel())
}
