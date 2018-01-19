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
    
    var manager: PresentableManager = TableDataManager()
    
    
    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "UITableView"
        
        tableView.bind(withPresentableManager: &manager)
    }

}

