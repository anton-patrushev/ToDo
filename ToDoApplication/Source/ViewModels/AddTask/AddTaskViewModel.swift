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
    
    init(tasksService: TasksServiceProtocol = TasksService()) {
        self.tasksService = tasksService
    }
    
    public var taskTitle = BehaviorSubject<String?>(value: nil)
    public var taskContent = BehaviorSubject<String?>(value: nil)
    
    // TODO: change
    public func createTask() {
        guard let title = try? self.taskTitle.value() else { return }
        guard let content = try? self.taskContent.value() else { return }
        
        self.tasksService.createTask(title: title, content: content)
    }
}
