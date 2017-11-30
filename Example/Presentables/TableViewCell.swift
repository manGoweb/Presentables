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


class TableViewCell: UITableViewCell, Presentable {
    
}

class TableViewCellPresenter: SelectablePresenter {
    
    var presentable: Presentable.Type = TableViewCell.self
    
    var configure: ((Presentable) -> ())?
    
    var didSelectCell: (() -> ())?
    
}
