//
//  AddTaskCoordinator.swift
//  ToDoApplication
//
//  Created by Anton Patrushev on 1.09.21.
//

import UIKit

class AddTaskCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    var childCoordinators = [Coordinator]()
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController, parentCoordinator: Coordinator?) {
        self.navigationController = navigationController
        self.parentCoordinator = parentCoordinator
    }
    
    func start() {
        let vc = AddTaskViewController()
        vc.viewModel = AddTaskViewModel()
        
        self.navigationController.pushViewController(vc, animated: true)
    }
    
    public func didFinish() {
        self.parentCoordinator?.childDidFinish(self)
        self.navigationController.popViewController(animated: false)
    }
}
