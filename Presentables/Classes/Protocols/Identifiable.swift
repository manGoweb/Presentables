//
//  Identifiable.swift
//  Presentables
//
//  Created by Ondrej Rafaj on 24/07/2017.
//  Copyright © 2017 manGoweb UK Ltd. All rights reserved.
//

import Foundation


public protocol Identifiable { }

extension Identifiable {
    
    public var identifier: String {
        let className: String = String(describing: self)
        return className
    }
    
    public static var identifier: String {
        let className: String = String(describing: self)
        return className
    }
    
}

extension UITableViewCell: Identifiable { }
extension UITableViewHeaderFooterView: Identifiable { }
extension UICollectionReusableView: Identifiable { }
