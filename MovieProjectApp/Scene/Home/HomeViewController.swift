//
//  HomeViewController.swift
//  MovieProjectApp
//
//  Created by Lala on 25.07.24.
//

import UIKit

class HomeViewController: UIViewController, HomeCellDelegate {
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var viewModel = HomeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        configViewModel()
//        configureUI()
    }
    
    func didSelectMovie(_ movie: Result) {
        let movieDetailVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "\(MovieDetailVC.self)") as! MovieDetailVC
        movieDetailVC.movie = movie // MovieDetailVC'ye ilgili veriyi gönderin
        
        // Tab barın gizlenmesi
        movieDetailVC.hidesBottomBarWhenPushed = true

        navigationController?.pushViewController(movieDetailVC, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        configureUI()
    }
    
    func configViewModel() {
        viewModel.getItems()
        viewModel.successCallback = {
            self.collection.reloadData()
            //reloadData()
        }
    }
    
//    func configureUI() {
//        titleLabel.text = NSLocalizedString("home_title", comment: "")
//    }
    
    func configureUI() {
        titleLabel.text = "home_title".localize
        collection.reloadData()
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.category.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath) as! HomeCell
        cell.configure(data: viewModel.category[indexPath.item])
        cell.delegate = self // Burada delegate'i ayarlıyoruz
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width, height: 318)
    }
    
}
