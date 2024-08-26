//
//  HomeHelper.swift
//  MovieProjectApp
//
//  Created by Lala on 31.07.24.
//

import Foundation

enum HomeCategory: String {
    case popular = "Popular"
    case topRated = "Top Rated"
}

enum HomeEndPoint: String {
    case popular = "movie/popular"
    case topRated = "movie/top_rated"
    
    var path: String {
        NetworkHelper.shared.urlConfig(path: self.rawValue)
    }
}
