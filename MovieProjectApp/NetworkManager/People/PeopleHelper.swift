//
//  PeopleHelper.swift
//  MovieProjectApp
//
//  Created by Lala on 31.07.24.
//

import Foundation
enum PeopleEndPoint: String {
    case popular = "person/popular"
    
    var path: String {
        NetworkHelper.shared.urlConfig(path: self.rawValue)
    }
}
