//
//  TableViewController.swift
//  Presentables
//
//  Created by Ondrej Rafaj on 08/14/2017.
//  Copyright (c) 2017 Ondrej Rafaj. All rights reserved.
//

import UIKit
import UIKit
import Presentables


class TableViewController: UITableViewController {
    
    var manager: TableViewPresentableManager = TableDataManager()
    
    
    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "UITableView with manager"
        
        tableView.bind(withPresentableManager: &manager)
    }

}

