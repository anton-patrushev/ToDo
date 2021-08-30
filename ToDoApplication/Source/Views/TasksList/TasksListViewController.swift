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
    
    var viewModel: TasksListViewModel!
    
    override func loadView() {
        view = TasksListView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureNavigationController()
        
        let taskViewModels = self.viewModel.getTaskViewModels()
        
        self.bindTasksTableView(to: taskViewModels)
        self.configureTaskCellTapHandling()
    }
    
    private func configureNavigationController() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = self.viewModel.navigationTitle
    }
    
    private func bindTasksTableView(to taskViewModels: Observable<[ListTaskViewModel]>) {
        taskViewModels
            .observe(on: MainScheduler.instance)
            .bind(to: self.mainView.tableView.rx.items(cellIdentifier: TaskCell.identifier, cellType: TaskCell.self)) {
                index, taskViewModel, cell in
                cell.configureWithTask(taskViewModel)
            }
            .disposed(by: self.disposeBag)
    }
    
    private func configureTaskCellTapHandling() {
        self.mainView.tableView.rx
            .modelSelected(ListTaskViewModel.self)
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [unowned self] task in
                task.tapOnTask()
                
                if let selectedRowIndexPath = self.mainView.tableView.indexPathForSelectedRow {
                    self.mainView.tableView.deselectRow(at: selectedRowIndexPath, animated: true)
                }
                
            })
            .disposed(by: self.disposeBag)
    }
}
