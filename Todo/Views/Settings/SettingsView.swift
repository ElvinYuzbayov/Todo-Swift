import SwiftUI

struct SettingsView: View {
    @Bindable var vm:TodoViewModel
    @AppStorage("appTheme") private var appTheme:AppTheme = .system
    @AppStorage("appLanguage") private var appLanguage: String = "en"
    var body: some View {
        Form{
         
            Section{
                NavigationLink{
                    StatisticView(vm:vm)
                } label:{
                    Label("statistic",systemImage:"chart.bar")
                }
                NavigationLink{
                    ThemeView()
                }label:{
                    Label("theme",systemImage:"moon")
                }
                NavigationLink{
                    LanguageView()
                }label:{
                    Label("language",systemImage:"globe")
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("settings")
            }
        }
            

    }
}
//
//#Preview {
//    SettingsView()
//}
