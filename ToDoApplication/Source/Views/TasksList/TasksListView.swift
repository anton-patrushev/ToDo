//
//  TaskListView.swift
//  ToDoApplication
//
//  Created by Anton Patrushev on 22.08.21.
//

import UIKit
import SnapKit

class TasksListView: UIView {
    
    var tableView = UITableView()
    
    init() {
        super.init(frame: .zero)
        
        self.setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        self.backgroundColor = .white
        
        self.tableView.tableFooterView = UIView()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.addSubview(self.tableView)
        
        self.tableView.snp.makeConstraints { make in
            make.width.height.equalTo(self)
        }
    }
}
