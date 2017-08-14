//
//  ViewController.swift
//  Presentables
//
//  Created by Ondrej Rafaj on 08/14/2017.
//  Copyright (c) 2017 Ondrej Rafaj. All rights reserved.
//

import UIKit
import Presentables


class ViewController: UITableViewController {
    
    let dataController = DataController()
    
    
    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Presentables!"
        
        var dc: PresentableManager = dataController
        tableView.bind(withPresentableManager: &dc)
    }

}

