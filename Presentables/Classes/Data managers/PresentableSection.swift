//
//  PresentableSection.swift
//  LUIElements
//
//  Created by Ondrej Rafaj on 24/07/2017.
//  Copyright © 2017 manGoweb UK Ltd. All rights reserved.
//

import Foundation


public typealias PresentableSections = [PresentableSection]


public enum PresentableAnimation {
    case none
}

public protocol PresentableSectionMarker {
    var header: PresenterHeader? { get set }
    var footer: PresenterFooter? { get set }
    var presenters: [Presenter] { get set }
}

public typealias PresentableSectionMarkers = [PresentableSectionMarker]

public class PresentableSection: PresentableSectionMarker {
    
    var bindableHeader: Observable<PresenterHeader?> = Observable(nil)
    var bindableFooter: Observable<PresenterFooter?> = Observable(nil)
    var bindablePresenters: Observable<[Presenter]?> = Observable(nil)
    
    public var headerAnimation: PresentableAnimation = .none
    public var header: PresenterHeader? {
        get {
            return bindableHeader.value
        }
        set {
            bindableHeader.value = newValue
        }
    }
    
    public var footerAnimation: PresentableAnimation = .none
    public var footer: PresenterFooter? {
        get {
            return bindableFooter.value
        }
        set {
            bindableFooter.value = newValue
        }
    }
    
    public var presenterAnimation: PresentableAnimation = .none
    public var presenters: [Presenter] {
        get {
            return bindablePresenters.value ?? []
        }
        set {
            bindablePresenters.value = newValue
        }
    }
    
    // MARK: Initialization
    
    public init() {
        
    }
    
}
