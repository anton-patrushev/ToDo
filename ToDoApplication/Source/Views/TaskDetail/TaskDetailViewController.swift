//
//  TaskDetailViewController.swift
//  ToDoApplication
//
//  Created by Anton Patrushev on 25.08.21.
//

import UIKit
import RxSwift
import RxCocoa

class TaskDetailViewController: BaseViewControllerWithInjectedMainView<TaskDetailView> {
    var viewModel: TaskDetailViewModel!
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.bindInputs()
        self.configureNavigationController()
        self.bindTaskSave()
    }
    
    private func configureNavigationController() {
        self.navigationItem.largeTitleDisplayMode = .never
        self.navigationItem.rightBarButtonItem = self.mainView.saveTaskBarButton
    }
    
    private func bindInputs() {
        self.viewModel.taskContent
            .bind(to: self.mainView.taskContentField.rx.text)
            .disposed(by: self.disposeBag)
        
        self.mainView.taskContentField.rx.text
            .bind(to: self.viewModel.taskContent)
            .disposed(by: self.disposeBag)
        
        self.viewModel.taskTitle
            .bind(to: self.mainView.taskTitleField.rx.text)
            .disposed(by: self.disposeBag)
        
        self.mainView.taskTitleField.rx.text
            .bind(to: self.viewModel.taskTitle)
            .disposed(by: self.disposeBag)
    }
    
    private func bindTaskSave() {
        self.mainView.saveTaskBarButton.rx.tap.bind {
            self.viewModel.updateTask()
        }.disposed(by: self.disposeBag)
    }
    
    deinit {
        print("deinit TaskDetailViewController")
    }
}
