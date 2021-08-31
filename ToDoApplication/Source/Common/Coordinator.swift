//
//  Coordinator.swift
//  ToDoApplication
//
//  Created by Anton Patrushev on 25.08.21.
//

import Foundation
import UIKit.UINavigationController

protocol Coordinator: AnyObject {
    var parentCoordinator: Coordinator? { get }
    var childCoordinators: [Coordinator] { get set }
    
    var navigationController: UINavigationController { get }
    
    func start()
    func childDidFinish(_ childCoordinator: Coordinator)
    func didFinish()
}

// default Coodinator utils implementation
extension Coordinator {
    func didFinish() {
        self.parentCoordinator?.childDidFinish(self)
    }
    
    func childDidFinish(_ childCoordinator: Coordinator) {
        if let index = self.childCoordinators.lastIndex(where: { coordinator in
            return childCoordinator === coordinator
        }) {
            
            self.childCoordinators.remove(at: index)
        }
    }
}
