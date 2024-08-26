//
//  ActorMovieController.swift
//  MovieProjectApp
//
//  Created by Lala on 01.08.24.
//

import UIKit

class ActorMovieController: UIViewController {
    @IBOutlet weak var collection: UICollectionView!
    
    var viewModel = PeopleViewModel()
    var cellId = "\(TopImageBottomLabel.self)"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureViewModel()
    }
    
    func configureUI() {
        collection.register(UINib(nibName: cellId, bundle: nil), forCellWithReuseIdentifier: cellId)
    }
    
    func configureViewModel() {
        viewModel.getActorMovieList()
        viewModel.successCallback = {
            self.collection.reloadData()
        }
    }
}

extension ActorMovieController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.movieItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! TopImageBottomLabel
        cell.configure(data: viewModel.movieItems[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 2 - 10, height: 220)
    }
}
