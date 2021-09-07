//
//  TaskListServicesProtocol.swift
//  ToDoApplication
//
//  Created by Anton Patrushev on 22.08.21.
//

import Foundation
import RxSwift

protocol TaskService: AnyObject {
    func getTasks() ->  Observable<[Task]>
    func createTask(task: CreateTaskServiceInput)
    func updateTask(task: UpdateTaskServiceInput) -> Task?
}
