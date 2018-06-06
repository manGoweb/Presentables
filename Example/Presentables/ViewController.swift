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
        tableButton.backgroundColor = tableButton.tintColor
        tableButton.layer.cornerRadius = 6
        tableButton.setTitle("Table view example", for: UIControl.State.normal)
        tableButton.setTitleColor(.white, for: UIControl.State.normal)
        view.addSubview(tableButton)
        tableButton.addTarget(self, action: #selector(didTapTableButton), for: UIControl.Event.touchUpInside)
        tableButton.snp.makeConstraints { (make) in
            make.top.equalTo(120)
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.height.equalTo(44)
        }
        
        let tableButton2 = UIButton()
        tableButton2.backgroundColor = tableButton2.tintColor
        tableButton2.layer.cornerRadius = 6
        tableButton2.setTitle("Table view example 2", for: UIControl.State.normal)
        tableButton2.setTitleColor(.white, for: UIControl.State.normal)
        view.addSubview(tableButton2)
        tableButton2.addTarget(self, action: #selector(didTapTable2Button), for: UIControl.Event.touchUpInside)
        tableButton2.snp.makeConstraints { (make) in
            make.top.equalTo(tableButton.snp.bottom).offset(20)
            make.left.right.height.equalTo(tableButton)
        }
        
        let collectionButton = UIButton()
        collectionButton.backgroundColor = collectionButton.tintColor
        collectionButton.layer.cornerRadius = 6
        collectionButton.setTitle("Collection view example", for: UIControl.State.normal)
        collectionButton.setTitleColor(.white, for: UIControl.State.normal)
        view.addSubview(collectionButton)
        collectionButton.addTarget(self, action: #selector(didTapCollectionButton), for: UIControl.Event.touchUpInside)
        collectionButton.snp.makeConstraints { (make) in
            make.top.equalTo(tableButton2.snp.bottom).offset(20)
            make.left.right.height.equalTo(tableButton2)
        }
    }
    
    // MARK: Actions
    
    @objc func didTapTableButton() {
        let c = TableViewController()
        navigationController?.pushViewController(c, animated: true)
    }
    
    @objc func didTapTable2Button() {
        let c = ManagerTableViewController()
        navigationController?.pushViewController(c, animated: true)
    }
    
    @objc func didTapCollectionButton() {
        let c = CollectionViewController()
        navigationController?.pushViewController(c, animated: true)
    }
    
}


