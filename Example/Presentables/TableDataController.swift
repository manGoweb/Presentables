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
    
    // MARK: Overriding table view delegate
    
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
    
    fileprivate func newPresenter(_ i: Int) -> TableViewCellPresenter {
        let presenter = TableViewCellPresenter()
        presenter.configure = { presentable in
            guard let cell = presentable as? TableViewCell else {
                fatalError("Why?!")
            }
            cell.textLabel?.text = "Cell number: \(i)"
        }
        presenter.didSelectCell = {
            print("Cell number: \(i) has been tapped!")
        }
        return presenter
    }
    
    fileprivate func newHeader(_ i: Int) -> TableViewHeaderPresenter {
        let header = TableViewHeaderPresenter()
        header.configure = { presentable in
            guard let header = presentable as? TableViewHeader else {
                fatalError("Why?!")
            }
            header.titleLabel.text = "Section: \(i)"
        }
        return header
    }
    
    fileprivate func loadBasicData() {
        let section = PresentableSection()
        
        section.header = newHeader((data.count + 1))
        
        // Add new cell every couple of seconds
        Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { (timer) in
            let presenter = self.newPresenter((section.presenters.count + 1))
            section.presenters.append(presenter)
        }
        
        // Add section to the data set
        data.append(section)
    }
    
}
