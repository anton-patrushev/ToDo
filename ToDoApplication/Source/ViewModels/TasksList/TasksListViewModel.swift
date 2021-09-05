//
//  TaskListViewModel.swift
//  ToDoApplication
//
//  Created by Anton Patrushev on 22.08.21.
//

import Foundation
import RxSwift



class TasksListViewModel {
    var coordinator: TasksListCoordinator!
    let taskListService: TasksServiceProtocol
    
    var navigationTitle = "Home"
    
    init(taskListService: TasksServiceProtocol = TasksService.shared) {
        self.taskListService = taskListService
    }
    
    public func getTaskViewModels() -> Observable<[ListTaskViewModel]> {
        
        let tasks = taskListService.getTasks()
        
        return tasks
            .map {
                tasks in
                return tasks.map { ListTaskViewModel(task :$0, coordinator: self.coordinator) }
            }
    }
    
    public func openAddTask() {
        self.coordinator.startAddTask()
    }
}
