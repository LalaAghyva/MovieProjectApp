//
//  File.swift
//  MovieProjectApp
//
//  Created by Lala on 28.07.24.
//

import Foundation
import SDWebImage

extension UIImageView {
    func loadUrl(urlStr: String) {
        let postBaseURL = "https://image.tmdb.org/t/p/original"
        if let url = URL(string: postBaseURL + urlStr) {
            self.sd_setImage(with: url)
        }
    }
}
