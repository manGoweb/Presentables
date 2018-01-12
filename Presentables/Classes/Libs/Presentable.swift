//
//  Presentable.swift
//  Presentables
//
//  Created by Ondrej Rafaj on 24/07/2017.
//  Copyright © 2017 manGoweb UK Ltd. All rights reserved.
//

import Foundation
import UIKit


public protocol Presentable {
    
    associatedtype PresentableItem
    associatedtype ConfigureClosure
    associatedtype SelectedClosure
    
    var configure: ConfigureClosure? { get set }
    var selected: SelectedClosure? { get set }
    
}

extension Presentable {
    
    public var identifier: String {
        return String(describing: PresentableItem.self)
    }
    
    public var reusableType: PresentableItem.Type {
        return PresentableItem.self
    }
    
}

public protocol PresentableHeader: Presentable {
    
    static func create(_ configure: ConfigureClosure?) -> Cell<PresentableItem>
    
}

public protocol PresentableFooter: Presentable {
    
    static func create(_ configure: ConfigureClosure?) -> Cell<PresentableItem>
    
}

public protocol PresentableCell: Presentable {
    
    @discardableResult func cellSelected(_ selected: SelectedClosure) -> Self
    static func create(_ configure: ConfigureClosure?) -> Cell<PresentableItem>
    
}


//struct AnyHeader<T: PresentableAble>: PresentableAble {
//
//    typealias ConfigureClosure = T
//
//    private let presentable: T
//
//    init(_ presentable: T) {
//        self.presentable = presentable
//    }
//
////    func attack() -> T.Power {
////        return pokemon.attack()
////    }
//}



open class Cell<T>: Presentable {
    
    public typealias PresentableItem = T
    public typealias ConfigureClosure = (T) -> Void
    public typealias SelectedClosure = () -> Void
    
    public var configure: ((T) -> Void)?
    public var selected: (() -> Void)?
    
    @discardableResult public func cellSelected(_ selected: @escaping SelectedClosure) -> Self {
        self.selected = selected
        return self
    }
    
    public static func create(_ configure: ConfigureClosure? = nil) -> Cell<T> {
        let presentable = Cell<T>()
        presentable.configure = configure
        return presentable
    }
    
    public init() { }
    
}


open class Header<T>: Presentable {
    
    public typealias PresentableItem = T
    public typealias ConfigureClosure = (T) -> Void
    public typealias SelectedClosure = () -> Void
    
    public var configure: ((T) -> Void)?
    public var selected: (() -> Void)?
    
    public static func create(_ configure: ConfigureClosure? = nil) -> Header<T> {
        let presentable = Header<T>()
        presentable.configure = configure
        return presentable
    }
    
    public init() { }
    
}


open class Footer<T>: Presentable {
    
    public typealias PresentableItem = T
    public typealias ConfigureClosure = (T) -> Void
    public typealias SelectedClosure = () -> Void
    
    public var configure: ((T) -> Void)?
    public var selected: (() -> Void)?
    
    public static func create(_ configure: ConfigureClosure? = nil) -> Footer<T> {
        let presentable = Footer<T>()
        presentable.configure = configure
        return presentable
    }
    
    public init() { }
    
}

