//
//  TaskDetailViewController.swift
//  ToDoApplication
//
//  Created by Anton Patrushev on 25.08.21.
//

import UIKit
import RxSwift
import RxCocoa

class TaskDetailViewController: UIViewController {
    private var mainView: TaskDetailView {
        guard let mainView = self.view as? TaskDetailView else {
            fatalError("TaskDetailViewController.view must be a TaskDetailView type")
        }
        
        return mainView
    }
    
    var viewModel: TaskDetailViewModel!
    private let disposeBag = DisposeBag()
    
    override func loadView() {
        view = TaskDetailView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureTestButton()
    }
    
    private func configureTestButton() {
        self.mainView.testButton.rx.tap.bind { [unowned self] in
            self.viewModel.tapOnTestButton()
        }.disposed(by: self.disposeBag)
    }
}
