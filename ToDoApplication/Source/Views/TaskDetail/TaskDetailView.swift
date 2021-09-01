//
//  TaskDetailView.swift
//  ToDoApplication
//
//  Created by Anton Patrushev on 31.08.21.
//

import UIKit
import SnapKit

class TaskDetailView: UIView {
    
    lazy var containerScrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: .zero)
        scrollView.alwaysBounceVertical = true
        scrollView.alwaysBounceHorizontal = false
        
        return scrollView
    }()
    lazy var containerView: UIView = { UIView(frame: .zero) }()
    lazy var taskTitleField: UITextView = {
        var field = UITextView()

        field.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        field.isScrollEnabled = false
        
        return field
    }()
    lazy var taskContentField: UITextView = {
        var field =  UITextView()
        
        field.font = UIFont.preferredFont(forTextStyle: .body)
        field.isScrollEnabled = false
    
        return field
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
        
        self.addSubview(self.containerScrollView)
        self.containerScrollView.addSubview(self.containerView)
        self.containerView.addSubview(self.taskTitleField)
        self.containerView.addSubview(self.taskContentField)
        
        self.containerScrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        self.containerView.snp.makeConstraints { make in
            make.left.right.equalTo(self)
            make.width.equalTo(self.containerScrollView)
            make.height.equalTo(self.containerScrollView)
        }
        
        self.taskTitleField.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
        }
        
        self.taskContentField.snp.makeConstraints { make in
            make.top.equalTo(self.taskTitleField.snp.bottom)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            //            make.height.greaterThanOrEqualToSuperview()
        }
    }
}
