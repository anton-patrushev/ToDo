//
//  TaskDetailView.swift
//  ToDoApplication
//
//  Created by Anton Patrushev on 31.08.21.
//

import UIKit
import SnapKit

class TaskDetailView: UIView {
    
    var containerScrollView = UIScrollView(frame: .zero)
    var taskTitleLabel = UILabel()
    var taskContentLabel = UILabel()
    
    init() {
        super.init(frame: .zero)
        
        self.configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        self.backgroundColor = .white
        
        self.taskTitleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        
        self.containerScrollView.alwaysBounceVertical = true
        
        self.addSubview(self.containerScrollView)
        self.containerScrollView.addSubview(self.taskTitleLabel)
        self.containerScrollView.addSubview(self.taskContentLabel)
        
        self.containerScrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.left.equalToSuperview()        }
        
        self.taskTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(10)
        }
        
        self.taskContentLabel.snp.makeConstraints { make in
            make.top.equalTo(self.taskTitleLabel).offset(40)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
        }
    }
}
