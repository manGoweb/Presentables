//
//  UICollectionView+Presentables.swift
//  Presentables
//
//  Created by Ondrej Rafaj on 22/03/2018.
//

import Foundation
import UIKit


extension UICollectionView {
    
    open func register<T>(_ cellClass: T.Type) where T: UICollectionViewCell {
        let identifier = String(describing: T.self)
        register(cellClass, forCellWithReuseIdentifier: identifier)
    }
    
    open func register<T>(header viewClass: T.Type) where T: UICollectionReusableView {
        let identifier = String(describing: T.self)
        register(viewClass, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: identifier)
    }
    
    open func register<T>(footer viewClass: T.Type) where T: UICollectionReusableView {
        let identifier = String(describing: T.self)
        register(viewClass, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: identifier)
    }
    
}
