//
//  CollectionViewCell.swift
//  Presentables_Example
//
//  Created by Ondrej Rafaj on 30/11/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation
import UIKit
import Presentables
import SnapKit


class CollectionViewCell: UICollectionViewCell, Presentable {
    
    let textLabel = UILabel()
    
    // MARK: Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        textLabel.textColor = .black
        textLabel.textAlignment = .center
        contentView.addSubview(textLabel)
        textLabel.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class CollectionViewCellPresenter: SelectablePresenter {
    
    var didSelectCell: (() -> ())?
    
    var presentable: Presentable.Type = CollectionViewCell.self
    
    var configure: ((Presentable) -> ())?
    
}
