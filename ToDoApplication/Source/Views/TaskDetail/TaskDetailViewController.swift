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
        
        self.configureContent()
        self.configureNavigationController()
    }
    
    private func configureNavigationController() {
        self.navigationItem.largeTitleDisplayMode = .never
    }
    
    private func configureContent() {
        self.viewModel.taskTitle
            .observe(on: MainScheduler.instance)
            .bind(to: self.mainView.taskTitleField.rx.text)
            .disposed(by: self.disposeBag)
        
        self.viewModel.taskContent
            .observe(on: MainScheduler.instance)
            .bind(to: self.mainView.taskContentField.rx.text)
            .disposed(by: self.disposeBag)
    }
}
