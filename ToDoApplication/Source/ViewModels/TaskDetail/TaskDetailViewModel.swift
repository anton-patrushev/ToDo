//
//  TaskDetailViewModel.swift
//  ToDoApplication
//
//  Created by Anton Patrushev on 30.08.21.
//

import Foundation

class TaskDetailViewModel {
    unowned var coordinator: Coordinator!
    private let task: Task
    
    init(buildWith task: Task) {
        self.task = task
    }
    
    public func tapOnTestButton() {
        coordinator.didFinish()
    }
}
