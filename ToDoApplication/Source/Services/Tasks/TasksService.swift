//
//  TaskListService.swift
//  ToDoApplication
//
//  Created by Anton Patrushev on 22.08.21.
//

import Foundation
import RxSwift

class TasksService: TasksServiceProtocol {
    
    let tasksRepository: TasksRepositoryProtocol
    
    init(tasksRepository: TasksRepositoryProtocol = FakeTasksRepository()) {
        self.tasksRepository = tasksRepository
    }
    
    func getTasks() -> Observable<[Task]> {
        return tasksRepository.loadTasks()
    }
    
    func createTask(title: String, content: String) -> Observable<Task> {
        return self.tasksRepository.saveTask(input: self.buildTaskRepositoryInput(title: title, content: content))
    }
    
    private func buildTaskRepositoryInput(title: String, content: String) -> TaskRepositoryInput {
        return TaskRepositoryInput(title: title, content: content)
    }
}
