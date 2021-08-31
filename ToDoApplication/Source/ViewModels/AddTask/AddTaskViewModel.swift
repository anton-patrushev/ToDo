//
//  AddTaskViewModel.swift
//  ToDoApplication
//
//  Created by Anton Patrushev on 1.09.21.
//

import Foundation

class AddTaskViewModel {
    var coordinator: Coordinator!

    private let tasksService: TasksServiceProtocol
    
    init(tasksService: TasksServiceProtocol = TasksService()) {
        self.tasksService = tasksService
    }
    
    // TODO: change
    public func createTask() {
        
    }
}
