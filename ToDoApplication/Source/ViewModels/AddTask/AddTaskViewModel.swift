//
//  AddTaskViewModel.swift
//  ToDoApplication
//
//  Created by Anton Patrushev on 1.09.21.
//

import Foundation
import RxSwift

class AddTaskViewModel {
    var coordinator: Coordinator!

    private let tasksService: TasksServiceProtocol
    
    init(tasksService: TasksServiceProtocol = TasksService.shared) {
        self.tasksService = tasksService
    }
    
    public var taskTitle = BehaviorSubject<String?>(value: nil)
    public var taskContent = BehaviorSubject<String?>(value: nil)
    
    private var currentTaskTitleValue: String? {
        return try? taskTitle.value()
    }
    
    private var currentTaskContentValue: String? {
        return try? taskContent.value()
    }
    
    public func createTask() {
        guard let title = self.currentTaskTitleValue else { return }
        guard let content = self.currentTaskContentValue else { return }
        
        let createTaskServiceInput = self.buildCreateTaskServiceInput(title: title, content: content)
        
        self.tasksService.createTask(task: createTaskServiceInput)
        
        self.coordinator.didFinish()
    }
    
    private func buildCreateTaskServiceInput(title: String, content: String) -> CreateTaskServiceInput {
        return CreateTaskServiceInput(title: title, content: content)
    }
}
