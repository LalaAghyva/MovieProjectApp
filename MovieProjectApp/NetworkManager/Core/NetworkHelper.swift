//
//  NetworkHelper.swift
//  MovieProjectApp
//
//  Created by Lala on 25.07.24.
//

import Foundation

class NetworkHelper  {
    
    static let shared = NetworkHelper()
    
    let baseUrl = "https://api.themoviedb.org/3/"
    let apiKey = "bb9507f7e14d5bf8a94376d13f34384c"
    
    func urlConfig(path: String) -> String {
        baseUrl + path + "?api_key=\(apiKey)"
    }
}
