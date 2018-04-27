//
//  PresentableSection.swift
//  Presentables
//
//  Created by Ondrej Rafaj on 24/07/2017.
//  Copyright © 2017 manGoweb UK Ltd. All rights reserved.
//

import Foundation


public typealias PresentableType = AnyPresentable
public typealias PresentableSections = [PresentableSection]


public protocol PresentableSectionMarker {
    var header: PresentableType? { get set }
    var footer: PresentableType? { get set }
    var presentables: [PresentableType] { get set }
}

public typealias PresentableSectionMarkers = [PresentableSectionMarker]

public class PresentableSection: PresentableSectionMarker, Collection {
    
    public enum Animation {
        case none
    }
    
    var bindableHeader: Observable<PresentableType?> = Observable(nil)
    var bindableFooter: Observable<PresentableType?> = Observable(nil)
    var bindablePresenters: Observable<[PresentableType]?> = Observable(nil)
    
    public var headerAnimation: Animation = .none
    public var header: PresentableType? {
        get {
            return bindableHeader.value
        }
        set {
            bindableHeader.value = newValue
        }
    }

    public var footerAnimation: Animation = .none
    public var footer: PresentableType? {
        get {
            return bindableFooter.value
        }
        set {
            bindableFooter.value = newValue
        }
    }
    
    public var presenterAnimation: Animation = .none
    
    @available(*, deprecated, message: "Use section.append(Presentable) directly")
    public var presentables: [PresentableType] {
        get {
            return _presentables
        }
        set {
            _presentables = newValue
        }
    }
    
    var _presentables: [PresentableType] {
        get {
            return bindablePresenters.value ?? []
        }
        set {
            bindablePresenters.value = newValue
        }
    }
    
    // MARK: Access
    
    public var startIndex: Int {
        get {
            return 0
        }
    }
    
    public var endIndex: Int {
        get {
            return _presentables.isEmpty ? 0 : (_presentables.count - 1)
        }
    }
    
    public func index(after i: Int) -> Int {
        if i >= count {
            fatalError("Presentable array index is out of bounds")
        }
        return i + 1
    }
    
    public subscript(index: Int) -> PresentableType {
        get {
            return _presentables[index]
        }
        set(newValue) {
            _presentables[index] = newValue
        }
    }
    
    public func index(where predicate: (PresentableType) throws -> Bool) rethrows -> Int? {
        return try _presentables.index(where: predicate)
    }
    
    public func append(_ presentable: PresentableType) {
        _presentables.append(presentable)
    }
    
    public func append(contentsOf presentables: [PresentableType]) {
        _presentables.append(contentsOf: presentables)
    }
    
    public func set(_ presentables: [PresentableType]) {
        _presentables = presentables
    }
    
    public func removeAll() {
        _presentables.removeAll()
    }
    
    public func insert(_ presentable: PresentableType, at index: Int) {
        _presentables.insert(presentable, at: index)
    }
    
    @discardableResult public func remove(at index: Int) -> PresentableType {
        return _presentables.remove(at: index)
    }
    
    public var count: Int {
        return _presentables.count
    }
    
    public var isEmpty: Bool {
        return _presentables.isEmpty
    }
    
    // MARK: Initialization
    
    public init() { }
    
}
