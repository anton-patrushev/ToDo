//
//  TaskDetailView.swift
//  ToDoApplication
//
//  Created by Anton Patrushev on 31.08.21.
//

import UIKit
import SnapKit

class TaskDetailView: UIView {
    
    var testButton = UIButton(type: .system)
    
    init() {
        super.init(frame: .zero)
        
        self.configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        self.backgroundColor = .white
        
        self.testButton.setTitle("Test button", for: .normal)
        self.addSubview(self.testButton)
        
        self.testButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
