//
//  AppLocalization.swift
//  Test Playground
//
//  Created by  Кирилл on 3/6/19.
//

import Foundation

enum AppLocalization: String, Localizable {
   
    enum General: String, Localizable {
        case ok = "OK"
        case save = "Save"
        case cancel = "Cancel"
        case close = "Close"
        case attention = "Attention"
        case unknown = "Unknown"
        case loading = "Loading"
        case refresh = "Refresh"
        case tryAgain = "TryAgain"
        case wipTitle = "WipTitle"
        case wipText = "WipText"
        case errorTitle = "Error"
        case errorLoading = "ErrorLoading"
        case errorUnknown = "ErrorUnknown"
    }
    
    case title = "AppTitle"
    
    enum Tabs: String, Localizable {
        case network = "TabRemoteListTitle"
        case local = "TabLocalListTitle"
        case service = "TabServiceTitle"
        case settings = "TabsettingsTitle"
    }
    
    enum Theme: String, Localizable {
        case light = "AppThemeLight"
        case dark = "AppThemeDark"
    }
    
    enum Language: String, Localizable {
        case english = "AppLanguageEnglish"
        case russian = "AppLanguageRussian"
    }

    enum List: String, Localizable {
        case title = "ListNavigationTitle"
        case empty = "ListEmptyPlaceholder"
    }

}
