//
//  TableViewCell.swift
//  Presentables
//
//  Created by Ondrej Rafaj on 14/08/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation
import UIKit
import Presentables


class TableViewCell: UITableViewCell {
    
    func configure() {
        
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class TableViewCell1: TableViewCell {
    
    override func configure() {
        super.configure()
        
        contentView.backgroundColor = UIColor.blue.withAlphaComponent(0.05)
    }
    
}

class TableViewCell2: TableViewCell {
    
}

