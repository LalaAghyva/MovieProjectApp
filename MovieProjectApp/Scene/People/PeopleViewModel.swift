//
//  PeopleViewModel.swift
//  MovieProjectApp
//
//  Created by Lala on 30.07.24.
//

import Foundation

class PeopleViewModel {
    var actorId: Int?
    var people: People?
    var items = [PeopleResult]()
    var movieItems = [Result]()
    
    var successCallback: (()->())?
    
    //    func getPopularMovies() {
    //        NetworkManager.shared.request(model: People.self,
    //                                      url: NetworkHelper.shared.urlConfig(path: "person/popular")) { peopleData, error in
    //            if let error = error {
    //                print(error)
    //            } else if let peopleData = peopleData {
    //                self.items = peopleData.result ?? []
    //                self.successCallback?()
    //            }
    //        }
    //    }
    
    func getPopularPeople() {
        PeopleManager.shared.getPopularPeople(page: (people?.page ?? 0) + 1) { people, errorMessage in
            if let errorMessage = errorMessage {
                
            } else if let people = people {
                self.people = people
//                self.items = people.result ?? []
                self.items.append(contentsOf: people.result ?? [])
                self.successCallback?()
            }
        }
    }
    
    func getActorMovieList() {
        PeopleManager.shared.getPopularPeopleMovieList(id: actorId ?? 0) { movieList, errorMessage in
            if let errorMessage = errorMessage {
                
            } else if let movieList = movieList {
                self.movieItems = movieList.cast ?? []
                self.successCallback?()
            }
        }
    }
    
    func pagination(index: Int) {
        if (index == items.count - 1) && (people?.page ?? 0 <= people?.totalPages ?? 0) {
            getPopularPeople()
        }
    }
    
    func reset() {
        items.removeAll()
        people = nil
        getPopularPeople()
    }
}
