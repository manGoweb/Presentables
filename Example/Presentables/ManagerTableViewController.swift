//
//  ManagerTableViewController.swift
//  Presentables_Example
//
//  Created by Ondrej Rafaj on 25/04/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
import Presentables


class ManagerTableViewController: PresentableTableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let section = PresentableSection()
        
        let header = Presentable<TableViewHeader>.create { (header) in
            header.titleLabel.text = "It works yet again!"
        }
        section.header = header
        
        let presentable = Presentable<TableViewCell2>.create({ (cell) in
            cell.textLabel?.text = "Custom cell"
        }).cellSelected {
            print("First cell has been selected")
        }
        section.append(presentable)
        
        data.append(section)
        
        presentableManager.selectedCell = { info in
            info.tableView.deselectRow(at: info.indexPath, animated: true)
            print("Did select cell no. \((info.indexPath.row + 1))")
        }
    }
    
}
