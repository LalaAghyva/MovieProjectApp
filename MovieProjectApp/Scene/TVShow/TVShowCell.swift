//
//  TVShowCell.swift
//  MovieProjectApp
//
//  Created by Lala on 22.09.24.
//


import UIKit

protocol TVShowCellDelegate: AnyObject {
    func didTapSeeAllButton(index: Int)
}

class TVShowCell: UICollectionViewCell {
    
    weak var delegate: TVShowCellDelegate?
    
    let tvshowTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    lazy var seeAllButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("See All", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(seeAllButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var tvshowItems = [ListModelProtocol]()
    
    var cellId = "\(TopImageBottomLabel.self)"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    func setupUI() {
        contentView.addSubview(tvshowTitle)
        contentView.addSubview(collectionView)
        contentView.addSubview(seeAllButton)
        
        NSLayoutConstraint.activate([
            tvshowTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            tvshowTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            tvshowTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: tvshowTitle.bottomAnchor, constant: 12),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            seeAllButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: -5),
            seeAllButton.trailingAnchor.constraint(equalTo: collectionView.trailingAnchor),
            seeAllButton.widthAnchor.constraint(equalToConstant: 70),
        ])
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: cellId, bundle: nil), forCellWithReuseIdentifier: cellId)
    }
    
    func configure(data: Category1) {
        tvshowItems = data.items
        tvshowTitle.text = data.title
        collectionView.reloadData()
    }
    
    func configure(data: ListModel) {
        tvshowItems = data.items
        tvshowTitle.text = data.title
        collectionView.reloadData()
    }
    
    @objc private func seeAllButtonTapped() {
        delegate?.didTapSeeAllButton(index: tag) 
    }

}

extension TVShowCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tvshowItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! TopImageBottomLabel
        cell.configure(data: tvshowItems[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 168, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        16
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        16
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 0)
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let selectedTVShow = tvshowItems[indexPath.item]
//        delegate?.didSelectTVShow(selectedTVShow)
//    }
}

//import UIKit
//
//
//class TVShowCell: UICollectionViewCell {
//    
//    @IBOutlet weak var tvshowTitle: UILabel!
//    @IBOutlet weak var collectionView: UICollectionView!
//    
//    private var tvshowItems = [TVShowItem]()
//    
//    var cellId = "\(TopImageBottomLabel.self)"
//    
//    func configure(data: Category1) {
//        tvshowItems = data.items
//        tvshowTitle.text = data.title
//        collectionView.reloadData()
//    }
//
//    override func layoutSubviews() {
//        collectionView.register(UINib(nibName: cellId, bundle: nil), forCellWithReuseIdentifier: cellId)
//    }
//}
//
//extension TVShowCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        tvshowItems.count
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! TopImageBottomLabel
//        cell.configure(data: tvshowItems[indexPath.item])
//        return cell
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        CGSize(width: 168, height: collectionView.frame.height)
//    }
//    
////    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
////        let selectedTVShow = tvshowItems[indexPath.item]
////        delegate?.didSelectTVShow(selectedTVShow)
////    }
//    
//}

