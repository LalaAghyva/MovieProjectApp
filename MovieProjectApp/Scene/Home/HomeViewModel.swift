//
//  HomeViewModel.swift
//  MovieProjectApp
//
//  Created by Lala on 25.07.24.
//

import Foundation

struct Category {
    let title: String
    let items: [Result]
}

class HomeViewModel {
    
    var category = [Category]()
    
    var successCallback : (()->())?
    var errorCallback: ((String)->())?
    
    func getItems() {
        let items: [HomeCategory] = [.topRated, .popular]
        for item in items {
            getMovieItems(category: item)
        }
    }
    
    
    private func getMovieItems(category: HomeCategory) {
        HomeManager.shared.getMovieItems(category: category) { movieData, error in
            if let error = error {
                self.errorCallback?(error)
            } else if let movieData = movieData {
                self.category.append(Category(title: category.rawValue, items: movieData.results ?? []))
                self.successCallback?()
            }
        }
    }
    
   /* func getPopularMovies() {
        NetworkManager.shared.request(model: Welcome.self,
                                      url: NetworkHelper.shared.urlConfig(path: "movie/popular")) { movieData, error in
            if let error = error {
                print(error)
            } else if let movieData = movieData {
                self.items = movieData.results ?? []
                self.successCallback?()
            }
        }
    } */
    
//    func getPopularMovies() {
//         NetworkManager.shared.request(model: Welcome.self,
//                                       url: NetworkHelper.shared.urlConfig(path: "movie/popular")) { movieData, error in
//             if let error = error {
//                 print(error)
//             } else if let movieData = movieData {
//                 self.category.append(Category(title: "Popular", items: movieData.results ?? []))
//                 self.successCallback?()
//             }
//         }
//     }
//    
//    func getTopRatedMovies() {
//         NetworkManager.shared.request(model: Welcome.self,
//                                       url: NetworkHelper.shared.urlConfig(path: "movie/top_rated")) { movieData, error in
//             if let error = error {
//                 print(error)
//             } else if let movieData = movieData {
//                 self.category.append(Category(title: "Top rated", items: movieData.results ?? []))
//                 self.successCallback?()
//             }
//         }
//     }
    
}
