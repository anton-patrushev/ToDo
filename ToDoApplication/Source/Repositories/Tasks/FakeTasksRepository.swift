//
//  TasksRepository.swift
//  ToDoApplication
//
//  Created by Anton Patrushev on 22.08.21.
//

import Foundation
import RxSwift

class FakeTasksRepository: TasksRepositoryProtocol {
    private var mockedTasksArray: [Task] = [
        Task(id: "1sgj5o", title: "Title 1", content: "ldsfhgljsh gkhfdskjghkskjdfhgk sfgjhdgkj "),
        Task(id: "9gfd590", title: "Title 2", content: "GJ fldkg fodg Sghjksdl g dskfgj h lsdjfhg lhdsflghsdfgksdgkjdfgkj"),
        Task(id: "df2g986", title: "Title 3", content: "GJ fldkg fodg Sghjksdl g dskfgj h lsdjfhg lhdsflghsdfgksdgkjdfgkj GJ fldkg fodg Sghjksdl g dskfgj h lsdjfhg lhdsflghsdfgksdgkjdfgkj GJ fldkg fodg Sghjksdl g dskfgj h lsdjfhg lhdsflghsdfgksdgkjdfgkj"),
        Task(id: "32df7hs", title: "Title 4", content: "GJ fldkg fodg Sghjksdl g dskfgj h lsdjfhg lhdsflghsdfgksdgkjdfgkj  GJ fldkg fodg Sghjksdl g dskfgj h lsdjfhg lhdsflghsdfgksdgkjdfgkj GJ fldkg fodg Sghjksdl g dskfgj h lsdjfhg lhdsflghsdfgksdgkjdfgkj"),
        Task(id: "1s32ej5o", title: "... 5", content: "GJ fds dfg fldkg fodg Sghjksdl g dskfgj h lsdjfhg lhdsflghsdfgksdgkjdfgkj"),
        Task(id: "y68jsdf0", title: "End Title", content: "943452"),
    ]
    
    public func loadTasks() -> Observable<[Task]> {
        return Observable.create { observer in
            observer.onNext(self.mockedTasksArray)
            observer.onCompleted()
            
            return Disposables.create()
        }
    }
    
    public func saveTask(input: TaskRepositoryInput) -> Observable<Task> {
        return Observable.create { observer in
            let task = self.buildTaskFromInput(input)
            
            self.mockedTasksArray.append(task)
            
            observer.onNext(task)
            observer.onCompleted()
            
            return Disposables.create()
        }
    }
    
    private func buildTaskFromInput(_ input: TaskRepositoryInput) -> Task {
        let id = self.nowDate
        
        print("new id -> \(id)")
        
        return Task(id: id, title: input.title, content: input.content)
    }
    
    private var nowDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .full
        
        return dateFormatter.string(from: Date())
    }
}
