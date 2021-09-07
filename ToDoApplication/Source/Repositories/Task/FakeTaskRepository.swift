//
//  TasksRepository.swift
//  ToDoApplication
//
//  Created by Anton Patrushev on 22.08.21.
//

import Foundation

enum UpdateTaskError: Error {
    case taskNotFound
}

class FakeTaskRepository: TaskRepository {
    private var mockedTasksArray: [Task] = [
        Task(id: "1sgj5o", title: "Title 1", content: "ldsfhgljsh gkhfdskjghkskjdfhgk sfgjhdgkj "),
        Task(id: "9gfd590", title: "Title 2", content: "GJ fldkg fodg Sghjksdl g dskfgj h lsdjfhg lhdsflghsdfgksdgkjdfgkj"),
        Task(id: "df2g986", title: "Title 3", content: "GJ fldkg fodg Sghjksdl g dskfgj h lsdjfhg lhdsflghsdfgksdgkjdfgkj GJ fldkg fodg Sghjksdl g dskfgj h lsdjfhg lhdsflghsdfgksdgkjdfgkj GJ fldkg fodg Sghjksdl g dskfgj h lsdjfhg lhdsflghsdfgksdgkjdfgkj"),
        Task(id: "32df7hs", title: "Title 4", content: "GJ fldkg fodg Sghjksdl g dskfgj h lsdjfhg lhdsflghsdfgksdgkjdfgkj  GJ fldkg fodg Sghjksdl g dskfgj h lsdjfhg lhdsflghsdfgksdgkjdfgkj GJ fldkg fodg Sghjksdl g dskfgj h lsdjfhg lhdsflghsdfgksdgkjdfgkj"),
        Task(id: "1s32ej5o", title: "... 5", content: "GJ fds dfg fldkg fodg Sghjksdl g dskfgj h lsdjfhg lhdsflghsdfgksdgkjdfgkj"),
        Task(id: "y68jsdf0", title: "End Title", content: "943452"),
    ]
    
    public func loadTasks() -> [Task] {
        return self.mockedTasksArray
    }
    
    public func saveTask(input: TaskRepositoryInput) -> Task {
        let task = self.createNewTask(from: input)
        self.mockedTasksArray.append(task)
        
        return task
    }
    
    func editTask(id: String, input: TaskRepositoryInput) throws -> Task {
        var task = self.buildTaskFromInput(input)
        task.id = id
        
        guard let indexToReplace = self.mockedTasksArray.firstIndex(where: { $0.id == task.id }) else {
            throw UpdateTaskError.taskNotFound
        }
        
        self.mockedTasksArray[indexToReplace] = task
        
        return task
    }
    
    private func createNewTask(from input: TaskRepositoryInput) -> Task {
        let id = self.nowDate
        var task = self.buildTaskFromInput(input)
        
        task.id = id
        
        return task
    }
    
    private func buildTaskFromInput(_ input: TaskRepositoryInput) -> Task {
        return Task(id: "temp-id", title: input.title, content: input.content)
    }
    
    private var nowDate: String {
        let nowDate = Date().timeIntervalSince1970
        
        return String(nowDate)
    }
}

extension FakeTaskRepository {
    static var shared = FakeTaskRepository()
}
