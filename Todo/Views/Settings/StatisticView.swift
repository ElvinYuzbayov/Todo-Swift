import SwiftUI

struct StatisticView: View {
    @Bindable var vm: TodoViewModel
    
    var body: some View {
        Form {
            Section("overview") {
                Label {
                    HStack {
                        Text("all_todos")
                        Spacer()
                        Text("\(vm.allTodosCount)")
                            .foregroundStyle(.secondary)
                    }
                } icon: {
                    Image(systemName: "list.bullet")
                }

                Label {
                    HStack {
                        Text("completed")
                        Spacer()
                        Text("\(vm.completedTodosCount)")
                            .foregroundStyle(.secondary)
                    }
                } icon: {
                    Image(systemName: "checkmark.circle")
                }

                Label {
                    HStack {
                        Text("pending")
                        Spacer()
                        Text("\(vm.pendingTodosCount)")
                            .foregroundStyle(.secondary)
                    }
                } icon: {
                    Image(systemName: "clock")
                }
                
              VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Label("completion_progress", systemImage: "chart.bar")
                        Spacer()
                        Text("\(vm.completedPercent)%")
                            .foregroundStyle(.secondary)
                    }
                    
                    ProgressView(value: Double(vm.completedPercent), total: 100)
                }
                .padding(.top, 6)
            }
        }
        .navigationTitle("statistic")
    }
}

#Preview {
    StatisticView(vm: TodoViewModel())
}
