//
//  HomeManager.swift
//  MovieProjectApp
//
//  Created by Lala on 31.07.24.
//

import Foundation

class HomeManager {
    static let shared = HomeManager()
    
    func getMovieItems(category: HomeCategory, completion: @escaping((Welcome?, String?)->())) {
        var url = ""
        switch category {
        case .popular:
            url = HomeEndPoint.popular.path
        case .topRated:
            url = HomeEndPoint.topRated.path
        }
        NetworkManager.shared.request(model: Welcome.self,
                                      url: url,
                                      complete: completion)
    }
}


