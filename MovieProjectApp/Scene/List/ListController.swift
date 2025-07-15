//
//  ListController.swift
//  MovieProjectApp
//
//  Created by Lala on 18.09.24.
//

import UIKit

class ListController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var viewModel : ListViewModel?
    
    
    var items: [TVShowItem] = []
    var onDataReceive: (() -> [TVShowItem])?
    
    var id1: Int?

    var category: ListModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
    
    private func loadData() {
        if let data = onDataReceive?() {
            items = data
            print("success: \(String(describing: items.count)) films")
            collectionView.reloadData()
        } else {
            
        }
    }
    
}

extension ListController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return category?.items.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ListCell", for: indexPath) as! ListCell
//        cell.configure(data: items[indexPath.item])
        if let items = category?.items {
            cell.configure(data: items[indexPath.item])
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.bounds.width, height: 30)
    }

}
