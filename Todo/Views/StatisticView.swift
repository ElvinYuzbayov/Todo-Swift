import SwiftUI

struct StatisticView: View {
    @Bindable var vm:TodoViewModel
    var body: some View {
        Form{
            Section("Overview"){
                Text("All todos \(vm.allTodosCount)")
                Text("Completed \(vm.completedTodosCount)")
                Text("Pending \(vm.pendingTodosCount)")
            }
        }
        .navigationTitle("Statistics")
        }
   
    }


//#Preview {
//    StatisticView(vm:TodoViewModel())
//}
