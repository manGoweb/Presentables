//
//  DataController.swift
//  Presentables
//
//  Created by Ondrej Rafaj on 14/08/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation
import Presentables


class DataController: PresentableTableViewDataManager {
    
    
    // MARK: Data
    
    private func newPresenter(_ i: Int) -> MyCellPresenter {
        let presenter = MyCellPresenter()
        presenter.configure = { presentable in
            guard let cell = presentable as? MyCell else {
                fatalError("Why?!")
            }
            cell.textLabel?.text = "Cell number: \(i)"
        }
        return presenter
    }
    
    private func newHeader(_ i: Int) -> MyHeaderPresenter {
        let header = MyHeaderPresenter()
        header.configure = { presentable in
            guard let header = presentable as? MyHeader else {
                fatalError("Why?!")
            }
            header.titleLabel.text = "Section: \(i)"
        }
        return header
    }
    
    private func loadBasicData() {
        let section = PresentableSection()
        
        section.header = newHeader((data.count + 1))
        
        // Create some basic cells
        for i: Int in 1...3 {
            let presenter = newPresenter(i)
            section.presenters.append(presenter)
        }
        
        // Add new cell every couple of seconds
        Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { (timer) in
            let presenter = self.newPresenter((section.presenters.count + 1))
            section.presenters.append(presenter)
        }
        
        // Add section to the data set
        data.append(section)
    }
    
    // MARK: Initialization
    
    override init() {
        super.init()
        
        loadBasicData()
        
        // Add new section every couple of seconds
        Timer.scheduledTimer(withTimeInterval: 10, repeats: true) { (timer) in
            self.loadBasicData()
        }
    }
    
    // MARK: Overriding table view delegate
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
}
