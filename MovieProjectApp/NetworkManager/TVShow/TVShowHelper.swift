//
//  TVShowHelper.swift
//  MovieProjectApp
//
//  Created by Lala on 21.09.24.
//

import Foundation

enum TVShowCategory: String {
    case popular = "Popular"
    case topRated = "Top Rated"
    
}

enum TVShowEndPoint: String {
    case popular = "tv/popular"
    case topRated = "tv/top_rated"
    
    var path: String {
        NetworkHelper.shared.urlConfig(path: self.rawValue)
    }
}
