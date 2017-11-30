//
//  CollectionViewController.swift
//  Presentables_Example
//
//  Created by Ondrej Rafaj on 30/11/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation
import UIKit
import Presentables
import SnapKit


class CollectionViewController: UICollectionViewController {
    
    let dataController = CollectionDataController()
    
    
    // MARK: Initialization
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 150, height: 50)
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "UICollectionView"
        
        collectionView?.backgroundColor = .white
        
        // Register your cells
        collectionView?.register(CollectionViewCell.self)
        collectionView?.register(header: CollectionViewHeader.self)
        
        // Do the binding
        var dc: CollectionViewPresentableManager = dataController
        collectionView?.bind(withPresentableManager: &dc)
    }
    
}
