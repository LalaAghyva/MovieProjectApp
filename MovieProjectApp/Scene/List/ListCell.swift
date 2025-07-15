//
//  ListCell.swift
//  MovieProjectApp
//
//  Created by Lala on 18.09.24.
//

import UIKit

class ListCell: UICollectionViewCell {
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func layoutSubviews() {
        imageView.layer.cornerRadius = 20
    }
    
    func configure(data: TVShowItem) {
        textLabel.text = data.name
        imageView.loadUrl(urlStr: data.posterPath ?? "")
    }
    
    func configure(data: ListModelProtocol) {
        textLabel.text = data.titleText
        imageView.loadUrl(urlStr: data.imagerUrl)
    }
}
