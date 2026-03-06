import Foundation

enum AppLanguage:String,CaseIterable{
case system
case en
case az
    
    var title:String{
        switch self{
        case .system:
            return "System"
        case .en:
            return "English"
        case .az:
            return "Azerbaijan"
        }
    }
    
    var locale:Locale?{
        switch self{
        case .system:
            return nil
        case .en:
          return  Locale(identifier: "en")
        case .az:
         return   Locale(identifier: "az")
        }
    }
    
    
}
