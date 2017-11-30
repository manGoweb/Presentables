//
//  TableViewController.swift
//  Presentables
//
//  Created by Ondrej Rafaj on 08/14/2017.
//  Copyright (c) 2017 Ondrej Rafaj. All rights reserved.
//

import UIKit
import Presentables


class TableViewController: UITableViewController {
    
    let dataController = TableDataController()
    
    
    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "UITableView"
        
        var dc: TableViewPresentableManager = dataController
        tableView.bind(withPresentableManager: &dc)
    }

}

