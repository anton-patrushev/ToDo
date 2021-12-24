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
    
    private lazy var titleLabel = { UILabel(frame: .zero) }()
    private lazy var openIcon: UIImageView = {
        let image = UIImage(systemName: "chevron.forward")
        
        return UIImageView(image: image)
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.configureCell()
    }
    
    private func configureCell() {
        
        self.contentView.addSubview(self.titleLabel)
        self.contentView.addSubview(self.openIcon)
        
        self.openIcon.snp.makeConstraints { make in
//            make.left.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview().offset(-10)
            make.top.equalToSuperview().offset(10)
        }
        
        self.titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalTo(self.openIcon.snp.leading).offset(-20)
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


