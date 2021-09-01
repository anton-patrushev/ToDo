//
//  AddTaskViewController.swift
//  ToDoApplication
//
//  Created by Anton Patrushev on 1.09.21.
//

import UIKit
import RxSwift
import RxCocoa

class AddTaskViewController: BaseViewControllerWithInjectedMainView<AddTaskView> {
    var viewModel: AddTaskViewModel!
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureNavigationController()
        self.bindTaskInputs()
        self.bindTaskSave()
    }
    
    private func configureNavigationController() {
        self.navigationItem.largeTitleDisplayMode = .never
        self.navigationItem.rightBarButtonItem = self.mainView.saveTaskBarButton
    }
    
    private func bindTaskInputs() {
        mainView.taskTitleField.rx.text
            .bind(to: self.viewModel.taskTitle)
            .disposed(by: self.disposeBag)
        
        mainView.taskContentField.rx.text
            .bind(to: self.viewModel.taskContent)
            .disposed(by: self.disposeBag)
    }
    
    private func bindTaskSave() {
        self.mainView.saveTaskBarButton.rx.tap.bind {
            self.viewModel.createTask()
        }.disposed(by: self.disposeBag)
    }
    
}
