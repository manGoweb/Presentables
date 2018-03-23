//
//  CollectionViewCell.swift
//  Presentables_Example
//
//  Created by Ondrej Rafaj on 22/03/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
import UIKit
import Presentables
import SnapKit


class CollectionViewCell: UICollectionViewCell {
    
    let titleLabel = UILabel()
    
    func configure() {
        contentView.backgroundColor = .white
        
        contentView.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        titleLabel.textColor = .black
        titleLabel.textAlignment = .center
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

