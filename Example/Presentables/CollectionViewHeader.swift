//
//  CollectionViewHeader.swift
//  Presentables_Example
//
//  Created by Ondrej Rafaj on 30/11/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation
import UIKit
import Presentables
import SnapKit


class CollectionViewHeader: UICollectionReusableView, Presentable {
    
    var titleLabel = UILabel()
    
    
    // MARK: Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .lightGray
        
        addSubview(titleLabel)
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


class CollectionViewHeaderPresenter: PresenterHeader {
    
    var presentable: Presentable.Type = CollectionViewHeader.self
    
    var configure: ((Presentable) -> ())?
    
}
