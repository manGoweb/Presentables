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
    
    @discardableResult func cellSelected(_ selected: SelectedClosure)
    static func create(_ configure: ConfigureClosure?) -> Cell<PresentableItem>
    
}


// Type-erasure magic

private class _AnyPresentableCellBase<PresentableItem, ConfigureClosure, SelectedClosure>: PresentableCell {

    init() {
        guard type(of: self) != _AnyPresentableCellBase.self else {
            fatalError("_AnyCoordinatorBase<FlowObservable> instances can not be created, only subclasses")
        }
    }

    var configure: ConfigureClosure {
        preconditionFailure("oops")
    }

    var selected: SelectedClosure {
        preconditionFailure()
    }

    // TODO: fix
    func cellSelected(_ selected: SelectedClosure) {
        preconditionFailure()
    }

    static func create(_ configure: ConfigureClosure?) -> Cell<PresentableItem> {
        preconditionFailure()
    }
}

private final class _AnyPresentableCellBox<Concrete: PresentableCell>: _AnyPresentableCellBase<Concrete.PresentableItem, Concrete.ConfigureClosure, Concrete.SelectedClosure> {
    let concrete: Concrete

    init(_ concrete: Concrete) {
        self.concrete = concrete
    }

    var configure: ConfigureClosure? {
        return concrete.configure
    }

    var selected: _AnyPresentableCellBox<Concrete>.SelectedClosure? {
        return concrete.selected
    }

    override func cellSelected(_ selected: Concrete.SelectedClosure) {
        concrete.cellSelected(selected)
    }

    static func create(_ configure: _AnyPresentableCellBox<Concrete>.ConfigureClosure?) -> Cell<_AnyPresentableCellBox<Concrete>.PresentableItem> {
        return Concrete.create(configure)
    }
}

final public class AnyPresentableCell<PresentableItemThing, ConfigureClosureThing, SelectedClosureThing>: PresentableCell {

    public typealias PresentableItem = PresentableItemThing

    public typealias ConfigureClosure = ConfigureClosureThing

    public typealias SelectedClosure = SelectedClosureThing


    private let box: _AnyPresentableCellBase<PresentableItem, ConfigureClosure, SelectedClosure>

    init<Concrete: PresentableCell>(_ concrete: Concrete) where Concrete.ConfigureClosure == ConfigureClosure, Concrete.PresentableItem == PresentableItem, Concrete.SelectedClosure == SelectedClosure {
        box = _AnyPresentableCellBox(concrete)
    }

    public var configure: ConfigureClosureThing? {
        return box.configure
    }

    public var selected: SelectedClosureThing? {
        return box.selected
    }

    public func cellSelected(_ selected: AnyPresentableCell<PresentableItem, ConfigureClosure, SelectedClosure>.SelectedClosure) {
        return box.cellSelected(selected)
    }

    public static func create(_ configure: ConfigureClosure?) -> Cell<AnyPresentableCell<PresentableItem, ConfigureClosure, SelectedClosure>.PresentableItem> {
        _AnyPresentableCellBase.create(configure as! ConfigureClosureThing as! _)
    }
 }





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

    let headers: [AnyHeader<MyItem, MyConfigure, MySelected>]
    
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

