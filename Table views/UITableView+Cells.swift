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
    
//    open func dequeueReusableCell<T>(withCellClass cellClass: T.Type) -> T? where T: UITableViewCell {
//        let cell: T? = dequeueReusableCell(withIdentifier: cellClass.identifier) as? T
//        return cell
//    }
//    
//    open func dequeueReusableCell<T>(withCellClass cellClass: T.Type, for indexPath: IndexPath) -> T where T: UITableViewCell {
//        let cell: T = dequeueReusableCell(withIdentifier: cellClass.identifier, for: indexPath) as! T
//        return cell
//    }
//    
//    public func dequeueReusableCell<T>(withPresentable presentable: Presentable<T>, for indexPath: IndexPath) -> UITableViewCell where T: Reusable {
//        let identifier: String = T.identifier
//        var cell: T? = dequeueReusableCell(withIdentifier: identifier) as? T
//        if cell == nil {
//            // TODO: Following needs to be made more type safe?
//            register(T.self as! UITableViewCell.Type)
//            cell = dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? T
//        }
//        presentable.configure?(cell!)
//        return cell as! UITableViewCell
//    }
//    
//    public func dequeueReusableHeaderFooter<T>(withPresentable presentable: Presentable<T>?) -> UITableViewHeaderFooterView? where T: Reusable {
//        guard let presentable = presentable else {
//            return nil
//        }
//        let identifier: String = T.identifier
//        var view: T? = dequeueReusableHeaderFooterView(withIdentifier: identifier) as? T
//        if view == nil {
//            // TODO: Following needs to be made more type safe?
//            register(T.self as! UITableViewHeaderFooterView.Type)
//            view = dequeueReusableHeaderFooterView(withIdentifier: identifier) as? T
//            guard view != nil else {
//                return nil
//            }
//        }
//        guard let v = view else {
//            return nil
//        }
//        presentable.configure?(v)
//        return v as? UITableViewHeaderFooterView
//    }
    
}
