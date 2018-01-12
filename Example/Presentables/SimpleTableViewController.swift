//
//  SimpleTableViewController.swift
//  Presentables_Example
//
//  Created by Ondrej Rafaj on 12/01/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
import UIKit
import Presentables


class SimpleTableViewController: UITableViewController {
    
    var manager: TableViewPresentableManager = PresentableTableViewDataManager()
    
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Simple UITableView"
        
        // Create manager
        tableView.bind(withPresentableManager: &manager)
        
        // Create section
        let section = PresentableSection()

        // Add cells
        section.presentables.append(PresentableCell<UITableViewCell>.create({ (cell) in
            cell.detailTextLabel?.text = "First cell!"
        }))
        
        for i in 1...51 {
            section.presentables.append(PresentableCell<UITableViewCell>.create({ (cell) in
                cell.detailTextLabel?.text = "Cell no. \(i)"
            }))
        }
        
        manager.data.append(section)
    }
    
}

