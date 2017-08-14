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
    
    private func loadBasicData() {
        let section = PresentableSection()
        
        // Create some basic cells
        for i: Int in 1...5 {
            let presenter = newPresenter(i)
            section.presenters.append(presenter)
        }
        
        // Add new cell every second
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer) in
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
    }
    
}
