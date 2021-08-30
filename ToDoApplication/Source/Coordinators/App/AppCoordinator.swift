//
//  AppCoordinator.swift
//  ToDoApplication
//
//  Created by Anton Patrushev on 21.08.21.
//

import Foundation
import UIKit.UINavigationController

class AppCoordinator: Coordinator {
    let window: UIWindow
    var navigationController = UINavigationController()
    
    internal var childCoordinators = [Coordinator]()
    
    init(window: UIWindow) {
        self.window = window
    }
    
    private func configureWindow() {
        self.window.rootViewController = self.navigationController
        self.window.makeKeyAndVisible()
    }
    
    public func start() {
        self.configureWindow()
        
        let vc = TasksListViewController()
        vc.viewModel = TasksListViewModel(coordinator: self)
        
        self.navigationController.pushViewController(vc, animated: false)
    }
    
    public func startTaskDetail(with taskDetailViewModel: TaskDetailViewModel) {
        let taskDetailCoordinator =
            TaskDetailCoordinator(navigationController: self.navigationController, with: taskDetailViewModel)
        taskDetailCoordinator.start()
        
        childCoordinators.append(taskDetailCoordinator)
    }
}
