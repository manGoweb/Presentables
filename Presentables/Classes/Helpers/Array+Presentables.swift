//
//  Array+Presentables.swift
//  Presentables
//
//  Created by Ondrej Rafaj on 30/11/2017.
//

import Foundation


// MARK: - Section generators

public extension Array where Element == Presentable<UITableViewCell> {
    
    public var section: PresentableSection {
        get {
            let section = PresentableSection()
            section.presentables = self
            return section
        }
    }
    
}


// MARK: - Dynamic helpers for PresentableSections

public extension Array where Element: PresentableSectionMarker {
    
    func presentable(forIndexPath indexPath: IndexPath) -> Presentable<UITableViewCell> {
        let sections: PresentableSections = sectionsOrError()
        return sections[indexPath.section].presentables[indexPath.row]
    }
    
    func section(forIndexPath indexPath: IndexPath) -> PresentableSection {
        let sections: PresentableSections = sectionsOrError()
        return sections[indexPath.section]
    }
    
    func header(forIndexPath indexPath: IndexPath) -> Presentable<Reusable>? {
        return header(forSection: indexPath.section)
    }
    
    func footer(forIndexPath indexPath: IndexPath) -> Presentable<Reusable>? {
        return footer(forSection: indexPath.section)
    }
    
    func header(forSection section: Int) -> Presentable<Reusable>? {
        let sections: PresentableSections = sectionsOrError()
        return sections[section].header
    }
    
    func footer(forSection section: Int) -> Presentable<Reusable>? {
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

