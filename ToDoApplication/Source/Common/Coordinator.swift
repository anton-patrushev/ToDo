//
//  Coordinator.swift
//  ToDoApplication
//
//  Created by Anton Patrushev on 25.08.21.
//

import Foundation
import UIKit.UINavigationController

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
