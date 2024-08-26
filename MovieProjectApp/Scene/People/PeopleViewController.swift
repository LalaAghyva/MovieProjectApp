//
//  PeopleViewController.swift
//  MovieProjectApp
//
//  Created by Lala on 30.07.24.
//

import UIKit

class PeopleViewController: UIViewController {

    @IBOutlet weak var collection: UICollectionView!
    
    var coordinator: PeopleCoordinator?
    
    let refreshController = UIRefreshControl()
    
    var viewModel = PeopleViewModel()
    var cellId = "\(TopImageBottomLabel.self)"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coordinator = PeopleCoordinator(navigationController: navigationController ?? UINavigationController())
        
        configureUI()
        configureViewModel()
    }
    
    func configureUI() {
        refreshController.addTarget(self, action: #selector(pullToRefresh), for: .valueChanged)
        collection.refreshControl = refreshController
        collection.register(UINib(nibName: cellId, bundle: nil), forCellWithReuseIdentifier: cellId)
    }
    
    func configureViewModel() {
        viewModel.getPopularPeople()
        viewModel.getActorMovieList()
        viewModel.successCallback = {
            self.refreshController.endRefreshing()
            self.collection.reloadData()
        }
    }
    
    @objc func pullToRefresh() {
        viewModel.reset()
        collection.reloadData()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.viewModel.getPopularPeople()
        }
    }
}

extension PeopleViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! TopImageBottomLabel
        cell.configure(data: viewModel.items[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width/2 - 10, height: 220)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let controller = storyboard?.instantiateViewController(withIdentifier: "ActorMovieController") as! ActorMovieController
//        controller.viewModel.actorId = viewModel.items[indexPath.item].id
//        navigationController?.show(controller, sender: nil)
        coordinator?.showActorMovieController(id: viewModel.items[indexPath.item].id ?? 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        viewModel.pagination(index: indexPath.item)
    }
    
}
