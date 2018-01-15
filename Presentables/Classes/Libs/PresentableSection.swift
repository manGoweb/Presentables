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

public class PresentableSection: PresentableSectionMarker {
    
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
    public var presentables: [PresentableType] {
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
