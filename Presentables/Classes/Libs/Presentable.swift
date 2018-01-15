//
//  Presentable.swift
//  Presentables
//
//  Created by Ondrej Rafaj on 24/07/2017.
//  Copyright © 2017 manGoweb UK Ltd. All rights reserved.
//

import Foundation
import UIKit


public protocol AnyPresentable {
    
    var identifier: String { get }
    var storedType: AnyClass { get }
    var selected: (() -> Void)? { get set }
    
    func runConfigure(with: UIView?)
    
}


open class Presentable<T>: AnyPresentable {
    
    public typealias ConfigureClosure = (T) -> Void
    
    public typealias PresentableItem = T
    public var configure: ConfigureClosure?
    
    open var identifier: String {
        return String(describing: T.self)
    }
    
    public var reusableType: T.Type {
        return T.self
    }
    
    public var storedType: AnyClass {
        return T.self as! AnyClass
    }
    
    public var selected: (() -> Void)?
    @discardableResult public func cellSelected(_ selected: @escaping () -> Void) -> Self {
        self.selected = selected
        return self
    }
    
    public static func create(_ configure: ConfigureClosure? = nil) -> Presentable<T> {
        let presentable = Presentable<T>()
        presentable.configure = configure
        return presentable
    }
    
    public func runConfigure(with view: UIView?) {
        guard let view: T = view as? T else {
            return
        }
        configure?(view)
    }
    
}
