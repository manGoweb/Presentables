//
//  PresentableSection.swift
//  LUIElements
//
//  Created by Ondrej Rafaj on 24/07/2017.
//  Copyright © 2017 manGoweb UK Ltd. All rights reserved.
//

import Foundation


public enum PresentableAnimation {
    case none
    case basic
}


public class PresentableSection {
    
    var bindableHeader: Dynamic<PresenterHeader?> = Dynamic(nil)
    var bindableFooter: Dynamic<PresenterFooter?> = Dynamic(nil)
    var bindablePresenters: Dynamic<[Presenter]?> = Dynamic(nil)
    
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

public extension Array where Element == Presenter {
    
    public var section: PresentableSection {
        get {
            let section = PresentableSection()
            section.presenters = self
            return section
        }
    }
    
}

public extension Array where Element == PresentableSection {
    
    func presenter(forIndexPath indexPath: IndexPath) -> Presenter {
        return self[indexPath.section].presenters[indexPath.row]
    }

    func section(forIndexPath indexPath: IndexPath) -> PresentableSection {
        return self[indexPath.section]
    }
    
    func header(forIndexPath indexPath: IndexPath) -> PresenterHeader? {
        return header(forSection: indexPath.section)
    }
    
    func footer(forIndexPath indexPath: IndexPath) -> PresenterFooter? {
        return footer(forSection: indexPath.section)
    }
    
    func header(forSection section: Int) -> PresenterHeader? {
        return self[section].header
    }
    
    func footer(forSection section: Int) -> PresenterFooter? {
        return self[section].footer
    }
    
}
