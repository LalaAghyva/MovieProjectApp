//
//  PeopleMockManager.swift
//  MovieProjectApp
//
//  Created by Lala on 01.08.24.
//

import Foundation

class PeopleMockManager: PeopleManagerProtocol {
    static let shared = PeopleMockManager()
    
    func getPopularPeople(page: Int, complete: @escaping ((People?, String?) -> ())) {
        if let file = Bundle.main.url(forResource: "PopularPeople", withExtension: "json"),
           let data = try? Data(contentsOf: file) {
            do {
                let people = try JSONDecoder().decode(People.self, from: data)
                complete(people, nil)
            } catch {
                complete(nil, error.localizedDescription)
            }
        }
    }
    
    func getPopularPeopleMovieList(id: Int, complete: @escaping ((PeopleMovieList?, String?) -> ())) {
    }
    
    
}
