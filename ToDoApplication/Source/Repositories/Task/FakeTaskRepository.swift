//
//  TasksRepository.swift
//  ToDoApplication
//
//  Created by Anton Patrushev on 22.08.21.
//

import Foundation
import RxSwift

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
    
    private var tasks = BehaviorSubject<[Task]>(value: [Task]())
    
    public func loadTasks() -> Observable<[Task]> {
        self.tasks.onNext(self.mockedTasksArray)
        
        return self.tasks.asObservable()
    }
    
    public func saveTask(input: TaskRepositoryInput) -> Observable<Void> {
        return Observable<Void>.create { observer in
            let task = self.createNewTask(from: input)
            self.mockedTasksArray.append(task)
            
            self.tasks.onNext(self.mockedTasksArray)
            
            observer.onCompleted()
            
            return Disposables.create()
        }
    }
    
    func editTask(id: String, input: TaskRepositoryInput) -> Observable<Task> {
        return Observable<Task>.create { observer in
            let disposable = Disposables.create()
            
            var task = self.buildTaskFromInput(input)
            task.id = id
            
            guard let indexToReplace = self.mockedTasksArray.firstIndex(where: { $0.id == task.id }) else {
                observer.onError(UpdateTaskError.taskNotFound)
                return disposable
            }
            
            self.mockedTasksArray[indexToReplace] = task
            self.tasks.onNext(self.mockedTasksArray)
            
            observer.onCompleted()
            
            return disposable
        }
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
