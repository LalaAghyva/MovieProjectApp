//
//  SettingsViewController.swift
//  MovieProjectApp
//
//  Created by Lala on 02.08.24.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func changeLang(lang: String) {
        UserDefaults.standard.set(lang, forKey: "appLang")
        titleLabel.text = "Language change to \(lang)"
    }
    
    @IBAction func azTapped(_ sender: Any) {
        changeLang(lang: "Azerbaijan")
    }
    
    @IBAction func enTapped(_ sender: Any) {
        changeLang(lang: "English")
    }
    
    @IBAction func trTapped(_ sender: Any) {
        changeLang(lang: "Turkish")
    }
}
