//
//  TableDataManager.swift
//  Presentables_Example
//
//  Created by Ondrej Rafaj on 30/11/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation
import Presentables


class TableDataManager: PresentableTableViewDataManager {
    
    // MARK: Initialization
    
    override init() {
        super.init()
        
        loadBasicData()
    }
    
    fileprivate func loadBasicData() {
        let section = PresentableSection()
        
        // Create a custom header
        section.header = PresentableHeader<TableViewHeader>.create({ (header) in
            header.titleLabel.text = "My header :)"
        })
        
        // Create 50 cells (you can obviously specify an custom cell)
        for i in 1...51 {
            let presentable = PresentableCell<TableViewCell>.create({ (cell) in
                cell.textLabel?.text = "Id: \((i))"
            })
            section.presentables.append(presentable)
        }
        
        // Add section to the data set
        data.append(section)
    }
    
    // MARK: Overriding any table view delegate methods if needed (optional)
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
}
