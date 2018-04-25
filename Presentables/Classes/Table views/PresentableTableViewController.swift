//
//  PresentableTableViewController.swift
//  Presentables
//
//  Created by Ondrej Rafaj on 25/04/2018.
//

import Foundation
import UIKit


open class PresentableTableViewController: UITableViewController {
    
    public let presentableManager = PresentableTableViewDataManager()
    
    public var data: PresentableSections {
        get { return presentableManager.data }
        set { presentableManager.data = newValue }
    }
    
    // MARK: View lifecycle
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        var manager: PresentableManager = presentableManager
        tableView.bind(withPresentableManager: &manager)
    }
    
}
