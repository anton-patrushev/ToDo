//
//  TaskDetailViewModel.swift
//  ToDoApplication
//
//  Created by Anton Patrushev on 30.08.21.
//

import Foundation
import RxSwift

class TaskDetailViewModel {
    unowned var coordinator: Coordinator!
    private let task: Task
    
    init(buildWith task: Task) {
        self.task = task
    }
    
    public func tapOnTestButton() {
        coordinator.didFinish()
    }
    
    public var taskTitle: Observable<String> {
        Observable.create { observer in
            observer.onNext(self.task.title)
            observer.onCompleted()
            
            return Disposables.create()
        }
    }
    
    public var taskContent: Observable<String> {
        Observable.create { observer in
            observer.onNext(self.task.content)
            observer.onCompleted()
            
            return Disposables.create()
        }

    }
}
