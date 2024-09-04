//
//  MovieDetailVC.swift
//  MovieProjectApp
//
//  Created by Lala on 02.09.24.
//

import UIKit

class MovieDetailVC: UIViewController {
    
    var movie: Result?

    let scrollView = UIScrollView()
    let contentView = UIView()
    let posterImageView = UIImageView()
    let movieNameLabel = UILabel()
    let languageLabel = UILabel()
    let languageImage = UIImageView()
    let detailsSegmentedControl = UISegmentedControl(items: ["Details", "Trailer", "Cast", "Shots"])
    let movieDetailLabel = UILabel()

    private let textImageView: CustomView = {
        let view = CustomView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let textImageView2 = CustomView()
    let textImageView3 = CustomView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpUI()
        navigation()
    }
    
    func navigation() {
        let iconImage = UIImage(named: "share")
        let barButtonItem = UIBarButtonItem(image: iconImage, style: .plain, target: self, action: #selector(iconButtonTapped))
        navigationItem.rightBarButtonItem = barButtonItem
    }
        
    @objc private func iconButtonTapped() {
        let textToShare = movie?.overview
        let urlToShare = URL(string: "https://example.com")
        let imageToShare = UIImage(named: "shareImage")
        
        var items: [Any] = [textToShare, urlToShare as Any]
        if let image = imageToShare {
            items.append(image)
        }
        
        let activityViewController = UIActivityViewController(activityItems: items, applicationActivities: nil)
        
        if let popover = activityViewController.popoverPresentationController {
            popover.barButtonItem = navigationItem.rightBarButtonItem
        }
        present(activityViewController, animated: true, completion: nil)
    }
    
    func setUpUI() {
        setupScrollView()
        setUpPosterImageView()
        setUpMovieNameLabel()
        setUpTextImageView1()
        setUpTextImageView2()
        setUpTextImageView3()
        setupDetailsSegmentedControl()
        setUpMovieDetailLabel()
    }
    
    func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        scrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
    
    func setUpPosterImageView() {
        contentView.addSubview(posterImageView)
        posterImageView.loadUrl(urlStr: movie?.backdropPath ?? "")
        posterImageView.contentMode = .scaleAspectFill
        posterImageView.clipsToBounds = true
        posterImageView.layer.cornerRadius = 16
        posterImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            posterImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            posterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
            posterImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32),
            posterImageView.heightAnchor.constraint(equalToConstant: 400)
        ])
    }
    
    func setUpMovieNameLabel() {
        contentView.addSubview(movieNameLabel)
        movieNameLabel.text = movie?.title
        movieNameLabel.font = UIFont(name: "Poppins", size: 24)
        movieNameLabel.translatesAutoresizingMaskIntoConstraints = false
        movieNameLabel.numberOfLines = 0
        
        NSLayoutConstraint.activate([
            movieNameLabel.topAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant: 24),
            movieNameLabel.leadingAnchor.constraint(equalTo: posterImageView.leadingAnchor),
            movieNameLabel.trailingAnchor.constraint(equalTo: posterImageView.trailingAnchor),
        ])
    }
    
    func setUpTextImageView1() {
        contentView.addSubview(textImageView)
        textImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            textImageView.topAnchor.constraint(equalTo: movieNameLabel.bottomAnchor, constant: 16),
            textImageView.leadingAnchor.constraint(equalTo: movieNameLabel.leadingAnchor),
            textImageView.heightAnchor.constraint(equalToConstant: 26),
            textImageView.widthAnchor.constraint(equalToConstant: 88)
        ])
        
        textImageView.configure(withTitle: "English", imageName: "global")
    }
    
    func setUpTextImageView2() {
        contentView.addSubview(textImageView2)
        textImageView2.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            textImageView2.topAnchor.constraint(equalTo: movieNameLabel.bottomAnchor, constant: 16),
            textImageView2.leadingAnchor.constraint(equalTo: textImageView.trailingAnchor, constant: 32),
            textImageView2.heightAnchor.constraint(equalToConstant: 26),
            textImageView2.widthAnchor.constraint(equalToConstant: 88)
        ])
        
        textImageView2.configure(withTitle: "\(movie?.voteCount.map{ String($0).prefix(4)} ?? "")", imageName: "clock")
    }
    
    func setUpTextImageView3() {
        contentView.addSubview(textImageView3)
        textImageView3.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            textImageView3.topAnchor.constraint(equalTo: movieNameLabel.bottomAnchor, constant: 16),
            textImageView3.leadingAnchor.constraint(equalTo: textImageView2.trailingAnchor, constant: 16),
            textImageView3.heightAnchor.constraint(equalToConstant: 26),
            textImageView3.widthAnchor.constraint(equalToConstant: 88)
        ])
        
        textImageView3.configure(withTitle: "\(movie?.voteAverage.map{ String($0).prefix(4)} ?? "")/10", imageName: "star")
    }
    
    func setupDetailsSegmentedControl() {
        contentView.addSubview(detailsSegmentedControl)
        detailsSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
        detailsSegmentedControl.selectedSegmentTintColor = UIColor(red: 0/255, green: 153/255, blue: 255/255, alpha: 1.0)
        detailsSegmentedControl.selectedSegmentIndex = 0
        detailsSegmentedControl.layer.cornerRadius = 16
        
        let normalTextAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: "Poppins", size: 16) ?? UIFont.systemFont(ofSize: 16),
            .foregroundColor: UIColor.black
        ]
        detailsSegmentedControl.setTitleTextAttributes(normalTextAttributes, for: .normal)
        
        NSLayoutConstraint.activate([
            detailsSegmentedControl.topAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant: 140),
            detailsSegmentedControl.leadingAnchor.constraint(equalTo: posterImageView.leadingAnchor),
            detailsSegmentedControl.trailingAnchor.constraint(equalTo: posterImageView.trailingAnchor),
            detailsSegmentedControl.heightAnchor.constraint(equalToConstant: 40),
            detailsSegmentedControl.widthAnchor.constraint(equalToConstant: 350)
        ])
    }
    
    func setUpMovieDetailLabel() {
        contentView.addSubview(movieDetailLabel)
        movieDetailLabel.text = "\(movie?.originalTitle ?? "")\n\(movie?.overview ?? "")"
        movieDetailLabel.font = UIFont(name: "Poppins", size: 20)
        movieDetailLabel.translatesAutoresizingMaskIntoConstraints = false
        movieDetailLabel.numberOfLines = 0
        
        NSLayoutConstraint.activate([
            movieDetailLabel.topAnchor.constraint(equalTo: detailsSegmentedControl.bottomAnchor, constant: 24),
            movieDetailLabel.leadingAnchor.constraint(equalTo: detailsSegmentedControl.leadingAnchor),
            movieDetailLabel.trailingAnchor.constraint(equalTo: detailsSegmentedControl.trailingAnchor),
            movieDetailLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }
    
//    func setUILanguageLabel() {
//        textImageView.addSubview(languageLabel)
////        languageLabel.text = "English"
//        languageLabel.text = "\(movie?.voteAverage.map { String($0)} ?? "")/10"
//        languageLabel.font = UIFont(name: "Poppins", size: 16)
//        languageLabel.textColor = UIColor(red: 130/255, green: 130/255, blue: 130/255, alpha: 1.0)
//        languageLabel.translatesAutoresizingMaskIntoConstraints = false
//        
//        NSLayoutConstraint.activate([
//            languageLabel.topAnchor.constraint(equalTo: textImageView.topAnchor),
//            languageLabel.leadingAnchor.constraint(equalTo: textImageView.leadingAnchor),
////            languageLabel.trailingAnchor.constraint(equalTo: languageImage.trailingAnchor, constant: 8),
//            languageLabel.bottomAnchor.constraint(equalTo: textImageView.bottomAnchor)
//        ])
//    }
//    
//    func setUpLanguageImage() {
//        textImageView.addSubview(languageImage)
//        languageImage.image = UIImage(named: "global")
//        languageImage.contentMode = .scaleAspectFit
//        languageImage.translatesAutoresizingMaskIntoConstraints = false
//        
//        NSLayoutConstraint.activate([
//            languageImage.topAnchor.constraint(equalTo: textImageView.topAnchor),
//            languageImage.leadingAnchor.constraint(equalTo: languageLabel.leadingAnchor, constant: 55),
//            languageImage.trailingAnchor.constraint(equalTo: textImageView.trailingAnchor),
//            languageLabel.bottomAnchor.constraint(equalTo: textImageView.bottomAnchor),
//            languageImage.heightAnchor.constraint(equalToConstant: 24)
//        ])
//    }
    
}

