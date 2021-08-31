//
//  AppCoordinator.swift
//  ToDoApplication
//
//  Created by Anton Patrushev on 21.08.21.
//

import Foundation
import UIKit.UINavigationController

class AppCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    
    let window: UIWindow
    let navigationController = UINavigationController()
    
    internal var childCoordinators = [Coordinator]()
    
    init(window: UIWindow) {
        self.window = window
    }
    
    private func configureWindow() {
        self.window.rootViewController = self.navigationController
        self.window.makeKeyAndVisible()
    }
    
    public func start() {
        // TODO: put bootstrap logic
        self.configureWindow()
        
        let taskListCoordinator = TasksListCoordinator(navigationController: self.navigationController)
        taskListCoordinator.start()
    }
}
