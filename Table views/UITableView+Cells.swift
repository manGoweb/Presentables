//
//  UITableView+Cells.swift
//  Presentables
//
//  Created by Ondrej Rafaj on 05/07/2017.
//  Copyright © 2017 manGoweb UK Ltd. All rights reserved.
//

import UIKit


extension UITableView {
    
    open func register<T>(_ cellClass: T.Type) where T: UITableViewCell {
        register(cellClass, forCellReuseIdentifier: cellClass.identifier)
    }
    
    open func register<T>(_ viewClass: T.Type) where T: UITableViewHeaderFooterView {
        register(viewClass, forHeaderFooterViewReuseIdentifier: viewClass.identifier)
    }
    
}
