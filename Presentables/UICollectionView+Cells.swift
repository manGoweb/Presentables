//
//  UICollectionView+Cells.swift
//  Presentables
//
//  Created by Ondrej Rafaj on 13/07/2017.
//  Copyright © 2017 manGoweb UK Ltd. All rights reserved.
//

import Foundation
import UIKit


extension UICollectionView {
    
    open func register<T>(_ cellClass: T.Type) where T: UICollectionViewCell {
        register(cellClass, forCellWithReuseIdentifier: identifier(fromClass: cellClass))
    }
    
    open func dequeueReusableCell<T>(withCellClass cellClass: T.Type, for indexPath: IndexPath) -> T where T: UICollectionViewCell {
        let cell: T = dequeueReusableCell(withReuseIdentifier: identifier(fromClass: cellClass), for: indexPath) as! T
        return cell
    }
    
    // MARK: Private helpers
    
    private func identifier(fromClass cellClass: Swift.AnyClass) -> String {
        let className: String = String(describing: cellClass)
        return className
    }
    
}
