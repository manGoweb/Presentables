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
        register(cellClass, forCellWithReuseIdentifier: cellClass.identifier)
    }
    
    open func register<T>(header viewClass: T.Type) where T: UICollectionReusableView {
        register(viewClass, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: viewClass.identifier)
    }
    
    open func register<T>(footer viewClass: T.Type) where T: UICollectionReusableView {
        register(viewClass, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: viewClass.identifier)
    }
    
    open func dequeueReusableCell<T>(cellClass: T.Type, for indexPath: IndexPath) -> T? where T: UICollectionViewCell {
        let cell: T? = dequeueReusableCell(withReuseIdentifier: cellClass.identifier, for: indexPath) as? T
        return cell
    }
    
    public func dequeueReusableCell(withPresenter presenter: Presenter, for indexPath: IndexPath) -> UICollectionViewCell {
        let identifier: String = presenter.presentable.identifier
        let presentable: Presentable = dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! Presentable
        presenter.configure?(presentable)
        return presentable as! UICollectionViewCell
    }
    
    public func dequeueReusableHeader(withPresenter presenter: Presenter?, for indexPath: IndexPath) -> UICollectionReusableView? {
        guard let presenter = presenter else {
            return nil
        }
        let identifier: String = presenter.presentable.identifier
        let presentable: Presentable? = dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: identifier, for: indexPath) as? Presentable
        presenter.configure?(presentable!)
        return presentable as? UICollectionReusableView
    }
    
    public func dequeueReusableFooter(withPresenter presenter: Presenter?, for indexPath: IndexPath) -> UICollectionReusableView? {
        guard let presenter = presenter else {
            return nil
        }
        let identifier: String = presenter.presentable.identifier
        let presentable: Presentable? = dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionFooter, withReuseIdentifier: identifier, for: indexPath) as? Presentable
        presenter.configure?(presentable!)
        return presentable as? UICollectionReusableView
    }
    
}
