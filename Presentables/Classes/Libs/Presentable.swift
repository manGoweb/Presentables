//
//  Presentable.swift
//  Presentables
//
//  Created by Ondrej Rafaj on 24/07/2017.
//  Copyright © 2017 manGoweb UK Ltd. All rights reserved.
//

import Foundation
import UIKit


open class Presentable<T> {
    
    public typealias ConfigureClosure = (T) -> Void
    public typealias SelectedClosure = () -> Void
    
    public typealias PresentableItem = T
    public var configure: ConfigureClosure?
    
    open var identifier: String {
        return String(describing: T.self)
    }
    
    public var reusableType: T.Type {
        return T.self
    }
    
    var selected: SelectedClosure?
    @discardableResult public func cellSelected(_ selected: @escaping SelectedClosure) -> Self {
        self.selected = selected
        return self
    }
    
    public static func create(_ configure: ConfigureClosure? = nil) -> Presentable<T> {
        let presentable = Presentable<T>()
        presentable.configure = configure
        return presentable
    }
    
}
