//
//  TVShow.swift
//  MovieProjectApp
//
//  Created by Lala on 21.09.24.
//

import Foundation

// MARK: - TVShow
struct TVShow: Codable {
    let page: Int?
    let results: [TVShowItem]?
    let totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - TVShowItem
struct TVShowItem: Codable, TopImageBottomLabelProtocol, ListModelProtocol {
    var itemId: Int {
        id ?? 0
    }
    
    var titleText: String {
        name ?? ""
    }
    
    var imagerUrl: String {
        posterPath ?? ""
    }
    
    let adult: Bool?
    let backdropPath: String?
    let genreIDS: [Int]?
    let id: Int?
    let originCountry: [String]?
    let originalLanguage, originalName, overview: String?
    let popularity: Double?
    let posterPath: String?
    let firstAirDate, name: String?
    let voteAverage: Double?
    let voteCount: Int?

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originCountry = "origin_country"
        case originalLanguage = "original_language"
        case originalName = "original_name"
        case overview, popularity
        case posterPath = "poster_path"
        case firstAirDate = "first_air_date"
        case name
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}
