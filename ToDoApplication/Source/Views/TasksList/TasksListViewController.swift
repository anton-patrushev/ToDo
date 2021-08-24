//
//  TaskListViewController.swift
//  ToDoApplication
//
//  Created by Anton Patrushev on 22.08.21.
//

import UIKit
import RxSwift
import RxCocoa

class TasksListViewController: UIViewController {
    
    private var mainView: TasksListView {
        guard let mainView = self.view as? TasksListView else {
            fatalError("TasksListViewController.view must be a TasksListView type")
        }
        
        return mainView
    }
    
    private let disposeBag = DisposeBag()
    
    private let viewModel = TasksListViewModel()
    
    override func loadView() {
        view = TasksListView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = self.viewModel.navigationTitle
        
        self.viewModel.getTaskViewModels()
            .observe(on: MainScheduler.instance)
            .bind(to: self.mainView.tableView.rx.items(cellIdentifier: "cell")) {
                index, taskViewModel, cell in
                cell.textLabel?.text = taskViewModel.displayTitle
            }
            .disposed(by: self.disposeBag)
    }
}
