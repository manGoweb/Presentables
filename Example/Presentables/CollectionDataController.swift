//
//  CollectionDataController.swift
//  Presentables_Example
//
//  Created by Ondrej Rafaj on 30/11/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation
import Presentables


class CollectionDataController: PresentableCollectionViewDataManager {
    
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
    
    // MARK: Overriding collection view delegate methods
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
    // MARK: Memory management
    
    deinit {
        timer.invalidate()
    }
    
}

// MARK: - Data

extension CollectionDataController {
    
    fileprivate func newPresenter(_ i: Int) -> CollectionViewCellPresenter {
        let presenter = CollectionViewCellPresenter()
        presenter.configure = { presentable in
            guard let cell = presentable as? CollectionViewCell else {
                fatalError("Why?!")
            }
            cell.textLabel.text = "Cell number: \(i)"
            
            // Assign random color
            let hue = CGFloat(Double(arc4random() % 256) / 256.0) // 0.0 to 1.0
            let saturation = CGFloat(Double(arc4random() % 128) / 266.0 + 0.5) // 0.5 to 1.0, away from white
            let brightness = CGFloat(Double(arc4random() % 128) / 256.0 + 0.5) // 0.5 to 1.0, away from black
            cell.backgroundColor = UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1.0)
        }
        presenter.didSelectCell = {
            print("Cell number: \(i) has been tapped!")
        }
        return presenter
    }
    
    fileprivate func newHeader(_ i: Int) -> CollectionViewHeaderPresenter {
        let header = CollectionViewHeaderPresenter()
        header.configure = { presentable in
            guard let header = presentable as? CollectionViewHeader else {
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
