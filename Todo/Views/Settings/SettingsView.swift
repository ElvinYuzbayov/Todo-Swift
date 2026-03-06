import SwiftUI

struct SettingsView: View {
    @Bindable var vm:TodoViewModel
    @AppStorage("appTheme") private var appTheme:AppTheme = .system
    var body: some View {
        Form{
         
            Section{
                NavigationLink{
                    StatisticView(vm:vm)
                } label:{
                    Label("Statistic",systemImage:"chart.bar")
                }
                NavigationLink{
                    ThemeView()
                }label:{
                    Label("Theme",systemImage:"moon")
                }
                NavigationLink{
                    LanguageView()
                }label:{
                    Label("Language",systemImage:"globe")
                }
            }
        }.navigationTitle("Settings")

    }
}
//
//#Preview {
//    SettingsView()
//}
