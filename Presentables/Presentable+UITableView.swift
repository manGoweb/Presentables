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

extension UITableView: Bindable {
    
    public func register(presentableSections sections: inout [PresentableSection]) {
        for  i in 0 ... (sections.count - 1) {
            let section: PresentableSection = sections[i]
            section.bindableHeader.bind(listener: { (header) in
                switch section.headerAnimation {
                case .basic:
                    self.beginUpdates()
                    self.endUpdates()
                    break
                default:
                    self.reloadData()
                    break
                }
            })
            section.bindableFooter.bind(listener: { (footer) in
                switch section.footerAnimation {
                case .basic:
                    self.beginUpdates()
                    self.endUpdates()
                    break
                default:
                    self.reloadData()
                    break
                }
            })
            section.bindablePresenters.bind(listener: { (presenters) in
                switch section.presenterAnimation {
                case .basic:
                    self.beginUpdates()
                    self.insertRows(at: [IndexPath(row: section.presenters.count, section: i)], with: .fade)
                    self.endUpdates()
                    break
                default:
                    self.reloadData()
                    break
                }
            })
        }
        
        reloadData()
    }
    
}
