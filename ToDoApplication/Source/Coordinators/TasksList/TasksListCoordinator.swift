//
//  TaskListCoordinator.swift
//  ToDoApplication
//
//  Created by Anton Patrushev on 31.08.21.
//

import UIKit

class TasksListCoordinator: Coordinator {
    let parentCoordinator: Coordinator?
    let navigationController: UINavigationController
    
    internal var childCoordinators = [Coordinator]()
    
    init(navigationController: UINavigationController, parentCoordinator: Coordinator? = nil) {
        self.navigationController = navigationController
        self.parentCoordinator = parentCoordinator
    }
    
    public func start() {
        let viewModel = TasksListViewModel()
        viewModel.coordinator = self
        
        let vc = TasksListViewController()
        vc.viewModel = viewModel
        
        self.navigationController.pushViewController(vc, animated: false)
    }
    
    public func didFinish() {
        self.parentCoordinator?.childDidFinish(self)
        self.navigationController.popViewController(animated: false)
    }
    
    public func startTaskDetail(with taskDetailViewModel: TaskDetailViewModel) {
        let taskDetailCoordinator =
            TaskDetailCoordinator(navigationController: self.navigationController,
                                  viewModel: taskDetailViewModel,
                                  parentCoordinator: self)
        taskDetailCoordinator.start()
        
        childCoordinators.append(taskDetailCoordinator)
    }
    
    public func startAddTask() {
        let addTaskCoordinator = AddTaskCoordinator(navigationController: self.navigationController,
                                                    parentCoordinator: self.parentCoordinator)
        addTaskCoordinator.start()
        
        childCoordinators.append(addTaskCoordinator)
    }
}
