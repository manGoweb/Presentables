//
//  Identifyable.swift
//  LUIElements
//
//  Created by Ondrej Rafaj on 24/07/2017.
//  Copyright © 2017 manGoweb UK Ltd. All rights reserved.
//

import Foundation


public protocol Identifyable { }

extension Identifyable {
    
    public var identifier: String {
        let className: String = String(describing: self)
        // TODO: Do we want to strip module?
        return className
    }
    
    public static var identifier: String {
        let className: String = String(describing: self)
        // TODO: Do we want to strip module?
        return className
    }
    
}

extension UITableViewCell: Identifyable { }
extension UITableViewHeaderFooterView: Identifyable { }
extension UICollectionReusableView: Identifyable { }
