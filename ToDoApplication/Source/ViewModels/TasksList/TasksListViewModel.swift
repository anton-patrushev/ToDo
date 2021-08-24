//
//  TaskListViewModel.swift
//  ToDoApplication
//
//  Created by Anton Patrushev on 22.08.21.
//

import Foundation
import RxSwift



class TasksListViewModel {
    let taskListService: TasksServiceProtocol
    
    var navigationTitle = "Home"
    
    init(taskListService: TasksServiceProtocol = TasksService()) {
        self.taskListService = taskListService
    }
    
    func getTaskViewModels() -> Observable<[ListTaskViewModel]> {
        return taskListService.getTasks()
            .map {
                tasks in
                return tasks.map { ListTaskViewModel(task :$0) }
            }
    }
}
