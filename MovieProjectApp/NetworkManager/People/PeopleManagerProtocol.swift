//
//  PeopleManagerProtocol.swift
//  MovieProjectApp
//
//  Created by Lala on 01.08.24.
//

import Foundation
 
protocol PeopleManagerProtocol {
    func getPopularPeople(page: Int, complete: @escaping((People?, String?) -> ()))
    func getPopularPeopleMovieList(id: Int, complete: @escaping((PeopleMovieList?, String?)->()))
}
