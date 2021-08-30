//
//  TaskViewModel.swift
//  ToDoApplication
//
//  Created by Anton Patrushev on 22.08.21.
//

import Foundation

class ListTaskViewModel {
    private let coordinator: AppCoordinator
    private let task: Task
    
    public var displayTitle: String {
        return self.task.title
    }
    
    init(task:Task, coordinator: AppCoordinator) {
        self.coordinator = coordinator
        self.task = task
    }
    
    public func tapOnTask() {
        let viewModel = buildTaskDetailViewModel()
        coordinator.startTaskDetail(with: viewModel)
    }
    
    private func buildTaskDetailViewModel() -> TaskDetailViewModel {
        return TaskDetailViewModel(buildWith: self.task)
    }
}
