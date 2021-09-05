//
//  TasksRepositoryProtocol.swift
//  ToDoApplication
//
//  Created by Anton Patrushev on 22.08.21.
//

import Foundation
import RxSwift

protocol TasksRepositoryProtocol {
    func loadTasks() -> [Task]
    func saveTask(input: TaskRepositoryInput) -> Task
    func editTask(id: String, input: TaskRepositoryInput) throws -> Task
}
