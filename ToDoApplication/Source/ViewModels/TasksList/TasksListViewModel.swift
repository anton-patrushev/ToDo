//
//  TaskListViewModel.swift
//  ToDoApplication
//
//  Created by Anton Patrushev on 22.08.21.
//

import Foundation
import RxSwift



class TasksListViewModel {
    let coordinator: AppCoordinator
    let taskListService: TasksServiceProtocol
    
    var navigationTitle = "Home"
    
    init(coordinator: AppCoordinator, taskListService: TasksServiceProtocol = TasksService()) {
        self.coordinator = coordinator
        self.taskListService = taskListService
    }
    
    func getTaskViewModels() -> Observable<[ListTaskViewModel]> {
        return taskListService.getTasks()
            .map {
                tasks in
                return tasks.map { ListTaskViewModel(task :$0, coordinator: self.coordinator) }
            }
    }
}
