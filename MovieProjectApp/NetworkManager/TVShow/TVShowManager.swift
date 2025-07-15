//
//  TVShowManager.swift
//  MovieProjectApp
//
//  Created by Lala on 21.09.24.
//

import Foundation

class TVShowManager {
    static let shared = TVShowManager()
    
    func getMovieItems(category: TVShowCategory, completion: @escaping((TVShow?, String?)->())) {
        var url = ""
        switch category {
        case .popular:
            url = TVShowEndPoint.popular.path
        case .topRated:
            url = TVShowEndPoint.topRated.path
        }
        NetworkManager.shared.request(model: TVShow.self,
                                      url: url,
                                      complete: completion)
    }
}
