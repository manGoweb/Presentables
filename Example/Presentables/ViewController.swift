//
//  ViewController.swift
//  Presentables_Example
//
//  Created by Ondrej Rafaj on 30/11/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation
import UIKit
import SnapKit


class ViewController: UIViewController {
    
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Presentables!"
        
        view.backgroundColor = .white
        
        let tableButton = UIButton()
        tableButton.setTitle("Table view example", for: .normal)
        tableButton.setTitleColor(.black, for: .normal)
        view.addSubview(tableButton)
        tableButton.addTarget(self, action: #selector(didTapTableButton), for: .touchUpInside)
        tableButton.snp.makeConstraints { (make) in
            make.top.equalTo(120)
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.height.equalTo(44)
        }
        
        let collectionButton = UIButton()
        collectionButton.setTitle("Collection view example", for: .normal)
        collectionButton.setTitleColor(.black, for: .normal)
        view.addSubview(collectionButton)
        collectionButton.addTarget(self, action: #selector(didTapCollectionButton), for: .touchUpInside)
        collectionButton.snp.makeConstraints { (make) in
            make.top.equalTo(tableButton.snp.bottom).offset(20)
            make.left.right.height.equalTo(tableButton)
        }
    }
    
    // MARK: Actions
    
    @objc func didTapTableButton() {
        let c = TableViewController()
        navigationController?.pushViewController(c, animated: true)
    }
    
    @objc func didTapCollectionButton() {
//        let c = CollectionViewController()
//        navigationController?.pushViewController(c, animated: true)
    }
    
}


