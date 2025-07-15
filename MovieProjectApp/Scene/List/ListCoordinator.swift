//
//  ListCoordinator.swift
//  MovieProjectApp
//
//  Created by Lala on 01.10.24.
//

import Foundation
import UIKit

class ListCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func showProfileController(id1: Int) {
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "\(ListController.self)") as! ListController
        controller.id1 = id1
        navigationController.show(controller, sender: nil)
    }
}
