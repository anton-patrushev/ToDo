//
//  AddTaskCoordinator.swift
//  ToDoApplication
//
//  Created by Anton Patrushev on 1.09.21.
//

import UIKit

// TODO: fix memory leak when back button pressed
class AddTaskCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    var childCoordinators = [Coordinator]()
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController, parentCoordinator: Coordinator?) {
        self.navigationController = navigationController
        self.parentCoordinator = parentCoordinator
    }
    
    func start() {
        let viewModel = AddTaskViewModel()
        viewModel.coordinator = self
        
        let vc = AddTaskViewController()
        vc.viewModel = viewModel
        
        self.navigationController.pushViewController(vc, animated: true)
    }
    
    public func didFinish() {
        self.parentCoordinator?.childDidFinish(self)
        self.navigationController.popViewController(animated: false)
    }
}
