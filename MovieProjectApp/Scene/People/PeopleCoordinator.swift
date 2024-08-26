//
//  PeopleCoordinaor.swift
//  MovieProjectApp
//
//  Created by Lala on 05.08.24.
//

import Foundation
import UIKit

class PeopleCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func showActorMovieController(id: Int) {
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "\(ActorMovieController.self)" ) as! ActorMovieController
        controller.viewModel.actorId = id
        navigationController.show(controller, sender: nil)
    }
}
