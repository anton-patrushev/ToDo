//
//  TasksRepository.swift
//  ToDoApplication
//
//  Created by Anton Patrushev on 22.08.21.
//

import Foundation
import RxSwift

private let mockedTasksArray: [Task] = [
    Task(id: "1sgj5o", title: "Title 1", content: "Content"),
    Task(id: "9gfd590", title: "Title 2", content: "Content"),
    Task(id: "df2g986", title: "Title 3", content: "Content"),
    Task(id: "32df7hs", title: "Title 4", content: "Content"),
    Task(id: "1s32ej5o", title: "... 5", content: "Content"),
    Task(id: "y68jsdf0", title: "End Title", content: "Content"),
]


class FakeTasksRepository: TasksRepositoryProtocol {
    func loadTasks() -> Observable<[Task]> {
        return Observable.create { observer in
            observer.onNext(mockedTasksArray)
            observer.onCompleted()
            
            return Disposables.create()
        }
    }
}
