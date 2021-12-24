//
//  TaskDetailCoordinator.swift
//  ToDoApplication
//
//  Created by Anton Patrushev on 30.08.21.
//

import UIKit

// TODO: fix memory leak when back button pressed
class TaskDetailCoordinator: Coordinator {
    weak var parentCoordinator: Coordinator?
    
    private let viewModel: TaskDetailViewModel
    let navigationController: UINavigationController
    
    var childCoordinators = [Coordinator]()
    
    init(navigationController: UINavigationController, viewModel: TaskDetailViewModel, parentCoordinator: Coordinator) {
        self.navigationController = navigationController
        self.viewModel = viewModel
        self.parentCoordinator = parentCoordinator
    }
    
    public func start() {
        self.viewModel.coordinator = self
        
        let vc = TaskDetailViewController()
        vc.viewModel = self.viewModel
        self.navigationController.pushViewController(vc, animated: true)
    }
    
    public func didFinish() {
        self.parentCoordinator?.childDidFinish(self)
        self.navigationController.popViewController(animated: true)
    }
    
    deinit {
        print("release TaskDetailCoordinator")
    }
}
