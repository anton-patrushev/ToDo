//
//  AppCoordinator.swift
//  ToDoApplication
//
//  Created by Anton Patrushev on 21.08.21.
//

import Foundation
import UIKit.UINavigationController

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}

class AppCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc: UIViewController = TasksListViewController()
        self.navigationController.pushViewController(vc, animated: false)
    }
}
