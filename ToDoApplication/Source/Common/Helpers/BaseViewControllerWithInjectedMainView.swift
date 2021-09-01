//
//  BaseViewControllerWithInjectedMainView.swift
//  ToDoApplication
//
//  Created by Anton Patrushev on 1.09.21.
//

import UIKit

class BaseViewControllerWithInjectedMainView<IMainView: UIView>: UIViewController {
    var mainView: IMainView {
        guard let mainView = self.view as? IMainView else {
            fatalError("\(String(describing: Self.self)).view must be a \(String(describing: IMainView.self)) type")
        }
        
        return mainView
    }
    
    override func loadView() {
        view = IMainView()
    }
}
