//
//  TaskListView.swift
//  ToDoApplication
//
//  Created by Anton Patrushev on 22.08.21.
//

import UIKit
import SnapKit

class TasksListView: UIView {
    
    lazy var tableView: UITableView = { UITableView() }()
    lazy var addTaskImage: UIImage? = { UIImage(systemName: "plus.circle.fill") }()
    lazy var addTaskBarButton: UIBarButtonItem = {
        var button = UIBarButtonItem()
        
        button.image = addTaskImage
        button.style = .plain
        
        return button
    }()
    
    init() {
        super.init(frame: .zero)
        
        self.configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        self.backgroundColor = .white
        
        self.tableView.tableFooterView = UIView()
        self.tableView.register(TaskCell.self, forCellReuseIdentifier: TaskCell.identifier)
        self.addSubview(self.tableView)
        
        self.tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
