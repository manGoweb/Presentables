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
        register(cellClass, forCellReuseIdentifier: identifier(fromClass: cellClass))
    }
    
    open func dequeueReusableCell<T>(withCellClass cellClass: T.Type) -> T? where T: UITableViewCell {
        let cell: T? = dequeueReusableCell(withIdentifier: identifier(fromClass: cellClass)) as? T
        return cell
    }
    
    open func dequeueReusableCell<T>(withCellClass cellClass: T.Type, for indexPath: IndexPath) -> T where T: UITableViewCell {
        let cell: T = dequeueReusableCell(withIdentifier: identifier(fromClass: cellClass), for: indexPath) as! T
        return cell
    }
    
    public func dequeueReusableCell(withPresenter presenter: Presenter, for indexPath: IndexPath) -> UITableViewCell {
        let identifier: String = presenter.presentable.identifier
        var cell: Presentable? = dequeueReusableCell(withIdentifier: identifier) as? Presentable
        if cell == nil {
            // TODO: Following needs to be made more type safe?
            register(presenter.presentable as! UITableViewCell.Type)
            cell = dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? Presentable
        }
        presenter.configure?(cell!)
        return cell as! UITableViewCell
    }
    
    // MARK: Private helpers
    
    private func identifier(fromClass cellClass: Swift.AnyClass) -> String {
        let className: String = String(describing: cellClass)
        return className
    }
    
}
