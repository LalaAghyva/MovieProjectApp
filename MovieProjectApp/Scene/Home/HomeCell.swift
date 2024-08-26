//
//  HomeCell.swift
//  MovieProjectApp
//
//  Created by Lala on 26.07.24.
//

import UIKit

class HomeCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet private weak var collection: UICollectionView!
    
    private var movieItems = [Result]()
    var cellId = "\(TopImageBottomLabel.self)"

    func configure(data: Category) {
        movieItems = data.items
        titleLabel.text = data.title
        collection.reloadData()
    }
    
    override func layoutSubviews() {
        collection.register(UINib(nibName: cellId, bundle: nil), forCellWithReuseIdentifier: cellId)
    }
}

extension HomeCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        movieItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! TopImageBottomLabel
        cell.configure(data: movieItems[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 168, height: collectionView.frame.height)
    }
    
}
