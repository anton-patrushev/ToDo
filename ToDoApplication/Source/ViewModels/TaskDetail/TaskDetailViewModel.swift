//
//  TaskDetailViewModel.swift
//  ToDoApplication
//
//  Created by Anton Patrushev on 30.08.21.
//

import Foundation
import RxSwift

class TaskDetailViewModel {
    unowned var coordinator: Coordinator!
    private var task: Task
    private let tasksService: TasksServiceProtocol
    
    init(buildWith task: Task, tasksService: TasksServiceProtocol = TasksService.shared) {
        self.task = task
        self.tasksService = tasksService
        
        self.taskTitle = BehaviorSubject(value: task.title)
        self.taskContent = BehaviorSubject(value: task.content)
    }
    
    public var taskTitle: BehaviorSubject<String?>
    public var taskContent: BehaviorSubject<String?>
    
    public func updateTask() {
        guard let title = try? taskTitle.value() else { return }
        guard let content = try? taskContent.value() else { return }
        
        let newTask = Task(id: self.task.id, title: title, content: content)
        
        guard let updatedTask = self.tasksService.updateTask(task: self.buildUpdateTaskServiceInput(from: newTask)) else {
            return
        }
        
        self.task = updatedTask
    }
    
    private func buildUpdateTaskServiceInput(from model: Task) -> UpdateTaskServiceInput {
        return UpdateTaskServiceInput(id: model.id, title: model.title, content: model.content)
    }
}
