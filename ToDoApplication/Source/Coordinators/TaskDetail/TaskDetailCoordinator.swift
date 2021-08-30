//
//  TaskDetailCoordinator.swift
//  ToDoApplication
//
//  Created by Anton Patrushev on 30.08.21.
//

import UIKit

class TaskDetailCoordinator: Coordinator {
    private let viewModel: TaskDetailViewModel
    var navigationController = UINavigationController()
    
    var childCoordinators = [Coordinator]()
    
    init(navigationController: UINavigationController, with viewModel: TaskDetailViewModel) {
        self.navigationController = navigationController
        self.viewModel = viewModel
    }
    
    public func start() {
        let vc = TaskDetailViewController()
        vc.viewModel = self.viewModel
        self.navigationController.pushViewController(vc, animated: true)
    }
}
