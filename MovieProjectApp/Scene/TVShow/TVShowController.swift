//
//  TVShowController.swift
//  MovieProjectApp
//
//  Created by Lala on 18.09.24.
//

import UIKit

class TVShowController: UIViewController, TVShowCellDelegate {
//    var titleLabel: UILabel!
//    var collectionView: UICollectionView!
    
    var coordinator: ListCoordinator?
    
    let viewModel = TVShowViewModel()
    var items: TVShowItem?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configViewModel()
//        title = "TV Shows"
        
//        coordinator = ListCoordinator(navigationController: navigationController ?? UINavigationController())
    }
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "TV Shows"
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.delegate = self
        collection.dataSource = self
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.register(TVShowCell.self, forCellWithReuseIdentifier: "TVShowCell")
        collection.backgroundColor = .clear
        return collection
    }()
    
    func didTapSeeAllButton(index: Int) {
        coordinator?.showProfileController(id1: 1)
        
        let controller = storyboard?.instantiateViewController(identifier: "ListController") as! ListController
        
        controller.category = viewModel.items[index]
        
//        let allResults = viewModel.category.flatMap { $0.items }
        
//        controller.onDataReceive = { [weak self] in
//            return allResults
//        }
        
        controller.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(controller, animated: true)
    }

    

    func setupUI() {
        view.addSubview(titleLabel)
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        view.backgroundColor = .white
    }

    func configViewModel() {
        viewModel.getItems()
        viewModel.successCallback = {
            self.collectionView.reloadData()
        }
    }

}

extension TVShowController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.items.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TVShowCell", for: indexPath) as! TVShowCell
        cell.delegate = self
        cell.tag = indexPath.item
//        cell.configure(data: viewModel.category[indexPath.item])
        cell.configure(data: viewModel.items[indexPath.item])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 318)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        24
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        24
    }
}


//import UIKit
//
//class TVShowController: UIViewController {
//
//    
//    @IBOutlet weak var titleLabel: UILabel!
//    @IBOutlet weak var collectionView: UICollectionView!
//    
//    let viewModel = TVShowViewModel()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        configViewModel()
//    }
//    
//    func didSelectTVShow(_ movie: TVShowItem) {
////        let movieDetailVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "\(MovieDetailVC.self)") as! MovieDetailVC
////        movieDetailVC.movie = movie
////        movieDetailVC.hidesBottomBarWhenPushed = true
////        navigationController?.pushViewController(movieDetailVC, animated: true)
//    }
//    
//    
//    override func viewWillAppear(_ animated: Bool) {
//        configureUI()
//    }
//    
//    func configViewModel() {
//        viewModel.getItems()
//        viewModel.successCallback = {
//            self.collectionView.reloadData()
//            //reloadData()
//        }
//    }
//    
//    func configureUI() {
//        titleLabel.text = "TV Shows"
//        collectionView.reloadData()
//    }
//
//}
//
//extension TVShowController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return viewModel.category.count
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TVShowCell", for: indexPath) as! TVShowCell
//        cell.configure(data: viewModel.category[indexPath.item])
//        return cell
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        CGSize(width: collectionView.frame.width, height: 318)
//    }
//}
