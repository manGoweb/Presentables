//
//  TableViewHeader.swift
//  Presentables
//
//  Created by Ondrej Rafaj on 15/08/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation
import UIKit
import Presentables
import SnapKit


class TableViewHeader: UITableViewHeaderFooterView, Presentable {
    
    var titleLabel = UILabel()
    
    
    // MARK: Initialization
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .lightGray
        
        contentView.addSubview(titleLabel)
        titleLabel.textColor = .white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 17)
        titleLabel.snp.makeConstraints { (make) in
            make.height.equalTo(44)
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.top.bottom.equalTo(self)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


class TableViewHeaderPresenter: PresenterHeader {
    
    var presentable: Presentable.Type = TableViewHeader.self
    
    var configure: ((Presentable) -> ())?
    
}
