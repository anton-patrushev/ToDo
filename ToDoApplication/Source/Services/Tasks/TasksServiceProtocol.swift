//
//  TaskListServicesProtocol.swift
//  ToDoApplication
//
//  Created by Anton Patrushev on 22.08.21.
//

import Foundation
import RxSwift

protocol TasksServiceProtocol {
    func getTasks() -> Observable<[Task]>
    func createTask(title: String, content: String) -> Observable<Task>
}
