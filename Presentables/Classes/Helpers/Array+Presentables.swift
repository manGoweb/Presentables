//
//  Array+Presentables.swift
//  Presentables
//
//  Created by Ondrej Rafaj on 30/11/2017.
//

import Foundation


// MARK: - Section generators

public extension Array where Element == Presenter {
    
    public var section: PresentableSection {
        get {
            let section = PresentableSection()
            section.presenters = self
            return section
        }
    }
    
}


// MARK: - Dynamic helpers for PresentableSections

public extension Array where Element: PresentableSectionMarker {
    
    func presenter(forIndexPath indexPath: IndexPath) -> Presenter {
        let sections: PresentableSections = sectionsOrError()
        return sections[indexPath.section].presenters[indexPath.row]
    }
    
    func section(forIndexPath indexPath: IndexPath) -> PresentableSection {
        let sections: PresentableSections = sectionsOrError()
        return sections[indexPath.section]
    }
    
    func header(forIndexPath indexPath: IndexPath) -> PresenterHeader? {
        return header(forSection: indexPath.section)
    }
    
    func footer(forIndexPath indexPath: IndexPath) -> PresenterFooter? {
        return footer(forSection: indexPath.section)
    }
    
    func header(forSection section: Int) -> PresenterHeader? {
        let sections: PresentableSections = sectionsOrError()
        return sections[section].header
    }
    
    func footer(forSection section: Int) -> PresenterFooter? {
        let sections: PresentableSections = sectionsOrError()
        return sections[section].footer
    }
    
    // MARK: Private helpers
    
    private func sectionsOrError() -> PresentableSections {
        guard let sections = self as? PresentableSections else {
            fatalError("Object PresentableSection not present")
        }
        return sections
    }
    
}
