//
//  ListModel.swift
//  MovieProjectApp
//
//  Created by Lala on 21.10.24.
//

import Foundation

protocol ListModelProtocol {
    var itemId : Int { get }
    var titleText : String { get }
    var imagerUrl : String { get }
}

struct ListModel {
    let title: String
    let items: [ListModelProtocol]
}
