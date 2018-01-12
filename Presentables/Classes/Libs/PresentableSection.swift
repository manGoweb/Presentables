//
//  PresentableSection.swift
//  Presentables
//
//  Created by Ondrej Rafaj on 24/07/2017.
//  Copyright © 2017 manGoweb UK Ltd. All rights reserved.
//

import Foundation


public typealias PresentableSections = [PresentableSection]


public protocol PresentableSectionMarker {
    // TODO: Replace any with headers and footers?
    var header: Presentable<Reusable>? { get set }
    var footer: Presentable<Reusable>? { get set }
    var presentables: [Presentable<UITableViewCell>] { get set }
}

public typealias PresentableSectionMarkers = [PresentableSectionMarker]

public class PresentableSection: PresentableSectionMarker {
    
    public enum Animation {
        case none
    }
    
    var bindableHeader: Observable<Presentable<Reusable>?> = Observable(nil)
    var bindableFooter: Observable<Presentable<Reusable>?> = Observable(nil)
    var bindablePresenters: Observable<[Presentable<UITableViewCell>]?> = Observable(nil)
    
    public var headerAnimation: Animation = .none
    public var header: Presentable<Reusable>? {
        get {
            return bindableHeader.value
        }
        set {
            bindableHeader.value = newValue
        }
    }
    
    public var footerAnimation: Animation = .none
    public var footer: Presentable<Reusable>? {
        get {
            return bindableFooter.value
        }
        set {
            bindableFooter.value = newValue
        }
    }
    
    public var presenterAnimation: Animation = .none
    public var presentables: [Presentable<UITableViewCell>] {
        get {
            return bindablePresenters.value ?? []
        }
        set {
            bindablePresenters.value = newValue
        }
    }
    
    // MARK: Initialization
    
    public init() { }
    
}
