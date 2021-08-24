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
}
