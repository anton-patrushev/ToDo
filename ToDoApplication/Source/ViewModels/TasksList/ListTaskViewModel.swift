//
//  TaskViewModel.swift
//  ToDoApplication
//
//  Created by Anton Patrushev on 22.08.21.
//

import Foundation

class ListTaskViewModel {    
    private let task: Task
    
    var displayTitle: String {
        return self.task.title
    }
    
    init(task:Task) {
        self.task = task
    }
}
