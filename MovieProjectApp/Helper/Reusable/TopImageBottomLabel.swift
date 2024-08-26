//
//  TopImageBottomLabel.swift
//  MovieProjectApp
//
//  Created by Lala on 30.07.24.
//

import UIKit

protocol TopImageBottomLabelProtocol {
    var titleText : String { get }
    var imagerUrl : String { get }
}

class TopImageBottomLabel: UICollectionViewCell {

    @IBOutlet weak var topImage: UIImageView!
    @IBOutlet weak var bottomLabel: UILabel!
    
    override func layoutSubviews() {
        topImage.layer.cornerRadius = 20
    }
    
    func configure(data: TopImageBottomLabelProtocol) {
        bottomLabel.text = data.titleText
        topImage.loadUrl(urlStr: data.imagerUrl)
    }
    
//    func configure(data: PeopleResult) {
//        bottomLabel.text = data.name
//        topImage.loadUrl(urlStr: data.profilePath ?? "")
//    }
//    
//    func configure(data: Result) {
//        bottomLabel.text = data.title
//        topImage.loadUrl(urlStr: data.posterPath ?? "")
//    }
}
