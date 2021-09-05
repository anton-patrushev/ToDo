//
//  Task.Service.swift
//  ToDoApplication
//
//  Created by Anton Patrushev on 3.09.21.
//

import Foundation

struct UpdateTaskServiceInput: Identifiable {
    let id: String
    let title: String
    let content: String
}

struct CreateTaskServiceInput {
    let title: String
    let content: String
}
