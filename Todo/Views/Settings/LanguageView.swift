
import SwiftUI

struct LanguageView: View {
    @AppStorage("appLanguage") private var appLanguage:AppLanguage = .system
    var body: some View {
        Form{
            Section("language"){
                Picker("app_language",selection:$appLanguage){
                    ForEach(AppLanguage.allCases,id:\.self){
                        language in
                        Text(language.title).tag(language)
                    }
                }
            }
        }
    }
}

#Preview {
    LanguageView()
}
