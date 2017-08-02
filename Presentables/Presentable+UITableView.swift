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
        manager.bindableData.bind(listener: { (data) in
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
            section.bindableHeader.bind(listener: { (header) in
                self.reloadData()
            })
            section.bindableFooter.bind(listener: { (footer) in
                self.reloadData()
            })
            section.bindablePresenters.bind(listener: { (presenters) in
                self.reloadData()
            })
        }
        
        reloadData()
    }
    
}
