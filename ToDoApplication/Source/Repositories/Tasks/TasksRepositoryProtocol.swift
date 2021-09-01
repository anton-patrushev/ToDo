//
//  TasksRepositoryProtocol.swift
//  ToDoApplication
//
//  Created by Anton Patrushev on 22.08.21.
//

import Foundation
import RxSwift

protocol TasksRepositoryProtocol {
    func loadTasks() -> Observable<[Task]>
    func saveTask(input: TaskRepositoryInput) -> Observable<Task>
}
