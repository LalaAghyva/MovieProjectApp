//
//  String+ Extension.swift
//  MovieProjectApp
//
//  Created by Lala on 02.08.24.
//

import Foundation

extension String {
    var localize: String {
        let lang = UserDefaults.standard.string(forKey: "appLang")
        let path = Bundle.main.path(forResource: lang, ofType: "lproj") ?? ""
        let bundle = Bundle(path: path) ?? Bundle()
        
        return NSLocalizedString(self, tableName: nil, bundle: bundle, value: "", comment: "")
    }
}
