//
//  Array+Presentables.swift
//  Presentables
//
//  Created by Ondrej Rafaj on 30/11/2017.
//

import Foundation


// MARK: - Section generators

public extension Array where Element == TypedPresentableCell {
    
    public var section: PresentableSection {
        get {
            let section = PresentableSection()
            section.presentables = self
            return section
        }
    }
    
}


// MARK: - Dynamic helpers for PresentableSections

extension Array where Element: PresentableSection {
    
    func presentable(forIndexPath indexPath: IndexPath) -> TypedPresentableCell {
        let sections: PresentableSections = sectionsOrError()
        return sections[indexPath.section].presentables[indexPath.row]
    }
    
    func section(forIndexPath indexPath: IndexPath) -> PresentableSection {
        let sections: PresentableSections = sectionsOrError()
        return sections[indexPath.section]
    }
    
    func header(forIndexPath indexPath: IndexPath) -> TypedPresentableHeader? {
        return header(forSection: indexPath.section)
    }
    
    func footer(forIndexPath indexPath: IndexPath) -> TypedPresentableFooter? {
        return footer(forSection: indexPath.section)
    }
    
    func header(forSection section: Int) -> TypedPresentableHeader? {
        let sections: PresentableSections = sectionsOrError()
        return sections[section].header
    }
    
    func footer(forSection section: Int) -> TypedPresentableFooter? {
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

