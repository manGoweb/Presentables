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
        
        let basicTableButton = UIButton()
        basicTableButton.backgroundColor = .lightGray
        basicTableButton.setTitle("Basic table view example", for: .normal)
        basicTableButton.setTitleColor(.white, for: .normal)
        basicTableButton.layer.cornerRadius = 6
        view.addSubview(basicTableButton)
        //basicTableButton.addTarget(self, action: #selector(didTapBasicTableButton), for: .touchUpInside)
        basicTableButton.snp.makeConstraints { (make) in
            make.top.equalTo(120)
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.height.equalTo(44)
        }
        
        let tableButton = UIButton()
        tableButton.backgroundColor = tableButton.tintColor
        tableButton.setTitle("Table view with custom manager", for: .normal)
        tableButton.setTitleColor(.white, for: .normal)
        tableButton.layer.cornerRadius = basicTableButton.layer.cornerRadius
        view.addSubview(tableButton)
        tableButton.addTarget(self, action: #selector(didTapTableButton), for: .touchUpInside)
        tableButton.snp.makeConstraints { (make) in
            make.top.equalTo(basicTableButton.snp.bottom).offset(20)
            make.left.right.height.equalTo(basicTableButton)
        }
        
        let collectionButton = UIButton()
        collectionButton.backgroundColor = .lightGray
        collectionButton.setTitle("Collection view example (coming soon!)", for: .normal)
        collectionButton.setTitleColor(.white, for: .normal)
        collectionButton.layer.cornerRadius = basicTableButton.layer.cornerRadius
        collectionButton.isEnabled = false
        view.addSubview(collectionButton)
        collectionButton.snp.makeConstraints { (make) in
            make.top.equalTo(tableButton.snp.bottom).offset(20)
            make.left.right.height.equalTo(tableButton)
        }
    }
    
    // MARK: Actions
    
    @objc func didTapBasicTableButton() {
        let c = SimpleTableViewController()
        navigationController?.pushViewController(c, animated: true)
    }
    
    @objc func didTapTableButton() {
        let c = TableViewController()
        navigationController?.pushViewController(c, animated: true)
    }
    
}


