//
//  Presentable+UITableView.swift
//  LUIElements
//
//  Created by Ondrej Rafaj on 24/07/2017.
//  Copyright © 2017 manGoweb UK Ltd. All rights reserved.
//

import Foundation
import UIKit


fileprivate extension Array where Element == UITableViewCell.Type {
    
    func contains(className: AnyClass) -> Bool {
        return self.filter({$0 === className}).count > 0
    }
    
}

extension UITableView: PresentableCollectionElement {
    
    public func bind(withPresentableManager manager: inout PresentableManager) {
        let m = manager
        manager.bindableData.bind(listener: { (data) in
            for section: PresentableSection in m.data {
                self.register(section: section)
            }
            self.reloadData()
        })
        register(presentableSections: &manager.data)
        
        manager.needsReloadData = {
            self.reloadData()
        }
        
        dataSource = manager as? UITableViewDataSource
        delegate = manager as? UITableViewDelegate
    }
    
    public func register(presentableSections sections: inout PresentableSections) {
        guard sections.count > 0 else {
            return
        }
        
        for  i in 0 ... (sections.count - 1) {
            let section: PresentableSection = sections[i]
            register(section: section)
        }
        
        reloadData()
    }
    
    // MARK: Helpers
    
    func register(section: PresentableSection) {
        if section.bindableHeader.listener == nil {
            section.bindableHeader.bind(listener: { (header) in
                self.reloadData()
            })
        }
        if section.bindableFooter.listener == nil {
            section.bindableFooter.bind(listener: { (footer) in
                self.reloadData()
            })
        }
        if section.bindablePresenters.listener == nil {
            section.bindablePresenters.bind(listener: { (presenters) in
                if section.presenterAnimation == .none {
                    self.reloadData()
                }
                else {
                    //self.insertAndDeleteCellsForObjects(objects: presenters, originalObjects: presenters)
                }
            })
        }
    }
    
}

extension UITableView {
    
    func arrayInsertionDeletionAndNoopIndexes<T: Equatable>(objects: [T], originalObjects: [T]) -> ([Int], [Int], [Int]) {
        let insertions = objects.filter({ !originalObjects.contains($0) }).map({ objects.index(of: $0)! })
        let noops = originalObjects.filter({ objects.contains($0) }).map({ originalObjects.index(of: $0)! })
        let deletions = originalObjects.filter({ !objects.contains($0) }).map({ originalObjects.index(of: $0)! })
        
        return (insertions, deletions, noops)
    }
    
    func arrayInsertionDeletionAndNoopIndexPaths<T: Equatable>(objects: [T], originalObjects: [T], section: Int = 0) -> ([IndexPath], [IndexPath], [IndexPath]) {
        let (insertions, deletions, noops) = arrayInsertionDeletionAndNoopIndexes(objects: objects, originalObjects: originalObjects)
        
        let insertionIndexPaths = insertions.map({ IndexPath(row: $0, section: section) })
        let deletionIndexPaths = deletions.map({ IndexPath(row: $0, section: section) })
        let noopIndexPaths = noops.map({ IndexPath(row: $0, section: section) })
        
        return (insertionIndexPaths, deletionIndexPaths, noopIndexPaths)
    }
    
    func insertAndDeleteCellsForObjects<T: Equatable>(objects: [T], originalObjects: [T], section: Int = 0) {
        let (insertions, deletions, _) = arrayInsertionDeletionAndNoopIndexPaths(objects: objects, originalObjects: originalObjects, section: section)
        
        if insertions.count > 0 || deletions.count > 0 {
            beginUpdates()
            insertRows(at: insertions, with: .automatic)
            deleteRows(at: deletions, with: .automatic)
            endUpdates()
        }
    }
    
}

