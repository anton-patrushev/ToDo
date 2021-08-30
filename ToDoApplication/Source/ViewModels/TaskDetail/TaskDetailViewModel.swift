//
//  TaskDetailViewModel.swift
//  ToDoApplication
//
//  Created by Anton Patrushev on 30.08.21.
//

import Foundation
import UIKit.UIColor

class TaskDetailViewModel {
    private let task: Task
    
    init(buildWith task: Task) {
        self.task = task
        screenColor = .blue
    }
    
    public private(set) var screenColor: UIColor
}
