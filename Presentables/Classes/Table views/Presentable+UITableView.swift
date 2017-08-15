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
                self.reloadData()
            })
        }
    }
    
}
