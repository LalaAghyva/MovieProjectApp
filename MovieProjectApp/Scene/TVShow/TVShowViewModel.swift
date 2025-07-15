//
//  TVShowViewModel.swift
//  MovieProjectApp
//
//  Created by Lala on 21.09.24.
//

import Foundation

enum TVShowsCategory: String {
    case topRated = "Top Rated"
    case popular = "Popular"
}

struct Category1 {
    let title: String
    let items: [TVShowItem]
}

class TVShowViewModel {
    
//    var category = [Category1]()
    var items = [ListModel]()
    
    var successCallback : (()->())?
    var errorCallback: ((String)->())?
    
    func getItems() {
        let items: [TVShowCategory] = [.topRated, .popular]
        for item in items {
            getTVShowItems(category: item)
        }
    }
    
    
    private func getTVShowItems(category: TVShowCategory) {
        TVShowManager.shared.getMovieItems(category: category) { [weak self] tvShowData, error in
            if let error = error {
                self?.errorCallback?(error)
            } else if let tvShowData = tvShowData, let result = tvShowData.results {
//                self.category.append(Category1(title: category.rawValue, items: tvShowData.results ?? []))
                self?.items.append(.init(title: category.rawValue, items: result))
                self?.successCallback?()
            }
        }
    }
}
