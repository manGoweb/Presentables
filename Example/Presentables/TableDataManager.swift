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
        
        let section = PresentableSection()
        
        let header = Presentable<TableViewHeader>.create { (header) in
            header.titleLabel.text = "It works :)"
        }
        section.header = header
        
        let presentable = Presentable<TableViewCell1>.create({ (cell) in
            cell.textLabel?.text = "First cell"
        }).cellSelected {
            print("First cell has been selected")
        }
        section.presentables.append(presentable)
        
        for i in 2...51 {
            let presentable = Presentable<TableViewCell2>.create({ (cell) in
                cell.textLabel?.text = "Id: \((i))"
            })
            section.presentables.append(presentable)
        }
        
        data.append(section)
        
        selectedCell = { info in
            info.tableView.deselectRow(at: info.indexPath, animated: true)
            print("Did select cell no. \((info.indexPath.row + 1))")
        }
    }
    
    // MARK: Overriding table view delegate (optional)
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
}

