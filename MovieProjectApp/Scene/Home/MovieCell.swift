//
//  MovieCell.swift
//  MovieProjectApp
//
//  Created by Lala on 26.07.24.
//

import UIKit

class MovieCell: UICollectionViewCell {
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    override func layoutSubviews() {
        posterImage.layer.cornerRadius = 20
    }
    
    func configure(data: Result) {
        titleLabel.text = data.title
        posterImage.loadUrl(urlStr: data.posterPath ?? "")
    }
}
