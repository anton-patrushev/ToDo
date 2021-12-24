//
//  TaskListService.swift
//  ToDoApplication
//
//  Created by Anton Patrushev on 22.08.21.
//

import Foundation
import RxSwift

class TaskServiceImpl: TaskService {
    let tasksRepository: TaskRepository
    
    init(tasksRepository: TaskRepository = FakeTaskRepository.shared) {
        self.tasksRepository = tasksRepository
    }
    
    private func buildTaskRepositoryInput(title: String, content: String) -> TaskRepositoryInput {
        return TaskRepositoryInput(title: title, content: content)
    }
    
    func getTasks() -> Observable<[Task]> {
        return self.tasksRepository.loadTasks()
    }
    
    func createTask(task: CreateTaskServiceInput) -> Observable<Void> {
        let createTaskRepositoryInput = self.buildTaskRepositoryInput(title: task.title, content: task.content)
        
        return self.tasksRepository.saveTask(input: createTaskRepositoryInput)
    }
    
    func updateTask(task: UpdateTaskServiceInput) -> Observable<Task> {
        let repositoryInput = self.buildTaskRepositoryInput(title: task.title, content: task.content)
        
        return self.tasksRepository.editTask(id: task.id, input: repositoryInput)
    }
}

extension TaskServiceImpl {
    static var shared = TaskServiceImpl()
}
