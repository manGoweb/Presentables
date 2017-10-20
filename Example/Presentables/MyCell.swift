//
//  MyCell.swift
//  Presentables
//
//  Created by Ondrej Rafaj on 14/08/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation
import UIKit
import Presentables


class MyCell: UITableViewCell, Presentable {
    
}

class MyCellPresenter: SelectablePresenter {
    
    var presentable: Presentable.Type = MyCell.self
    
    var configure: ((Presentable) -> ())?
    
    var didSelectCell: (() -> ())?
    
}
