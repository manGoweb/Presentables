//
//  Array+Presentables.swift
//  Presentables
//
//  Created by Ondrej Rafaj on 30/11/2017.
//

import Foundation


// MARK: - Section generators

public extension Array where Element == PresentableType {
    
    public var section: PresentableSection {
        get {
            let section = PresentableSection()
            section._presentables = self
            return section
        }
    }
    
}


// MARK: - Dynamic helpers for PresentableSections

public extension Array where Element: PresentableSectionMarker {
    
    func presentable(forIndexPath indexPath: IndexPath) -> PresentableType {
        let sections: PresentableSections = sectionsOrError()
        return sections[indexPath.section][indexPath.row]
    }
    
    func section(forIndexPath indexPath: IndexPath) -> PresentableSection {
        let sections: PresentableSections = sectionsOrError()
        return sections[indexPath.section]
    }
    
    func header(forIndexPath indexPath: IndexPath) -> PresentableType? {
        return header(forSection: indexPath.section)
    }
    
    func footer(forIndexPath indexPath: IndexPath) -> PresentableType? {
        return footer(forSection: indexPath.section)
    }
    
    func header(forSection section: Int) -> PresentableType? {
        let sections: PresentableSections = sectionsOrError()
        return sections[section].header
    }

    func footer(forSection section: Int) -> PresentableType? {
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

