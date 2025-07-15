//
//  ReusableView.swift
//  MovieProjectApp
//
//  Created by Lala on 03.09.24.
//

import UIKit

class CustomView: UIView {

    private let titleLabel = UILabel()
    private let iconImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        addSubview(titleLabel)
        addSubview(iconImageView)
        
        titleLabel.text = "Default text"
        titleLabel.font = UIFont(name: "Poppins", size: 16)
        titleLabel.textColor = UIColor(red: 130/255, green: 130/255, blue: 130/255, alpha: 1.0)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        iconImageView.image = UIImage(named: "global")
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            iconImageView.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            iconImageView.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            iconImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            iconImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: 24),
            iconImageView.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
        
    func configure(withTitle title: String, imageName: String) {
        titleLabel.text = title
        iconImageView.image = UIImage(named: imageName)
    }
}
