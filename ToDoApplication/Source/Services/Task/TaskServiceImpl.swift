//
//  TaskListService.swift
//  ToDoApplication
//
//  Created by Anton Patrushev on 22.08.21.
//

import Foundation
import RxSwift

class TaskServiceImpl: TaskService {
    
    private lazy var tasks = BehaviorSubject(value: [Task]())
    
    private var tasksCurrentValue: [Task] {
        return (try? self.tasks.value()) ?? [Task]()
    }
    
    let tasksRepository: TaskRepository
    
    init(tasksRepository: TaskRepository = FakeTaskRepository.shared) {
        self.tasksRepository = tasksRepository
    }
    
    private func buildTaskRepositoryInput(title: String, content: String) -> TaskRepositoryInput {
        return TaskRepositoryInput(title: title, content: content)
    }
    
    func getTasks() -> Observable<[Task]> {
        let loadedTasks = self.tasksRepository.loadTasks()
        
        self.tasks.onNext(loadedTasks)
        
        return tasks.asObservable()
    }
    
    func createTask(task: CreateTaskServiceInput) {
        let createdTask = self.tasksRepository
            .saveTask(input: self.buildTaskRepositoryInput(title: task.title, content: task.content))
        
        var currentTasks = self.tasksCurrentValue
        currentTasks.append(createdTask)
        
        self.tasks.onNext(currentTasks)
    }
    
    func updateTask(task: UpdateTaskServiceInput) -> Task? {
        let repositoryInput = self.buildTaskRepositoryInput(title: task.title, content: task.content)
        guard let updatedTask = try? self.tasksRepository.editTask(id: task.id, input: repositoryInput) else { return nil }
        
        var currentTasks = self.tasksCurrentValue
        
        guard let indexToReplace = currentTasks.firstIndex(where: { $0.id == task.id }) else { return nil }
        
        currentTasks[indexToReplace] = updatedTask
        
        self.tasks.onNext(currentTasks)
        return updatedTask
    }
}

extension TaskServiceImpl {
    static var shared = TaskServiceImpl()
}
