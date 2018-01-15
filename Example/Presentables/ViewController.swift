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
        tableButton.setTitle("Table view example", for: .normal)
        tableButton.setTitleColor(.white, for: .normal)
        view.addSubview(tableButton)
        tableButton.addTarget(self, action: #selector(didTapTableButton), for: .touchUpInside)
        tableButton.snp.makeConstraints { (make) in
            make.top.equalTo(120)
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.height.equalTo(44)
        }
    }
    
    // MARK: Actions
    
    @objc func didTapTableButton() {
        let c = TableViewController()
        navigationController?.pushViewController(c, animated: true)
    }
    
}


