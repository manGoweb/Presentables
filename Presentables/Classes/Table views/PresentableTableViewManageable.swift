//
//  PresentableTableViewManageable.swift
//  Presentables
//
//  Created by Ondrej Rafaj on 25/04/2018.
//

import Foundation


public protocol PresentableTableViewManageable {
    var tableView: UITableView { get }
    var presentableManager: PresentableTableViewDataManager { get }
    var data: PresentableSections { get set }
}


extension PresentableTableViewManageable {
    
    public func bind() {
        var manager: PresentableManager = presentableManager
        tableView.bind(withPresentableManager: &manager)
    }
    
}
