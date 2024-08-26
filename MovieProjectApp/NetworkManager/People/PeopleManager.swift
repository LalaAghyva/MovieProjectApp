//
//  PeopleManager.swift
//  MovieProjectApp
//
//  Created by Lala on 31.07.24.
//

import Foundation
class PeopleManager: PeopleManagerProtocol {
    static let shared = PeopleManager()
    
    func getPopularPeople(page: Int, complete: @escaping((People?, String?)->())) {
        NetworkManager.shared.request(model: People.self,
                                      url: PeopleEndPoint.popular.path + "&page=\(page)",
                                      complete: complete)
    }
    
    func getPopularPeopleMovieList(id: Int, complete: @escaping((PeopleMovieList?, String?)->())) {
        NetworkManager.shared.request(model: PeopleMovieList.self,
                                      url: NetworkHelper.shared.urlConfig(path: "person/\(id)/movie_credits"),
                                      complete: complete)
    }
}
