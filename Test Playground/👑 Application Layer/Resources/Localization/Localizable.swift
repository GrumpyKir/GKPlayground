//
//  Localizable.swift
//  Test Playground
//
//  Created by  Кирилл on 3/6/19.
//

import Foundation

protocol Localizable: RawRepresentable { }

extension Localizable {
    
    var key: String {
        return self.rawValue as? String ?? ""
    }
    
    var localized: String {
        let lang: String = AppLocalizationManager.current.type.localizationKey
        if let path = Bundle.main.path(forResource: lang, ofType: "lproj"), let bundle = Bundle(path: path) {
            return NSLocalizedString(self.key, tableName: nil, bundle: bundle, value: "", comment: "")
        } else {
            return NSLocalizedString(self.key, comment: "")
        }
    }
    
}
