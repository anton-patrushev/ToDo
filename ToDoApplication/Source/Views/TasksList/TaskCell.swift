//
//  TaskCell.swift
//  ToDoApplication
//
//  Created by Anton Patrushev on 24.08.21.
//

import Foundation
import UIKit

class TaskCell: UITableViewCell {
    static let identifier = "TaskCell"
    
    private let titleLabel = UILabel(frame: .zero)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.configureCell()
    }
    
    private func configureCell() {
        
        self.contentView.addSubview(self.titleLabel)
        
        self.titleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview().offset(-10)
            make.top.equalToSuperview().offset(10)
        }
    }
    
    
    public func configureWithTask(_ task: ListTaskViewModel) {
        self.titleLabel.text = task.displayTitle
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


