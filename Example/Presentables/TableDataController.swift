//
//  TableDataController.swift
//  Presentables_Example
//
//  Created by Ondrej Rafaj on 30/11/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation
import Presentables


class TableDataController: PresentableTableViewDataManager {
    
    var timer: Timer!
    
    // MARK: Initialization
    
    override init() {
        super.init()
        
        loadBasicData()
        
        // Add new section every couple of seconds
        timer = Timer.scheduledTimer(withTimeInterval: 6, repeats: true) { (timer) in
            self.loadBasicData()
        }
    }
    
    // MARK: Overriding table view delegate (optional)
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
    // MARK: Memory management
    
    deinit {
        timer.invalidate()
    }
    
}

// MARK: - Data

extension TableDataController {
    
    fileprivate func loadBasicData() {
        let section = PresentableSection()
        
//        section.header = newHeader((data.count + 1))
        
        // Add new cell every couple of seconds
        Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { (timer) in
            let presentable = Presentable<UITableViewCell>.create({ (cell) in
                cell.textLabel?.text = "Id: \((section.presentables.count + 1))"
            })
            section.presentables.append(presentable)
        }
        
        // Add section to the data set
        data.append(section)
    }
    
}
