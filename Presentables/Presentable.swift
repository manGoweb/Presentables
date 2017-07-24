//
//  Presentable.swift
//  LUIElements
//
//  Created by Ondrej Rafaj on 24/07/2017.
//  Copyright © 2017 manGoweb UK Ltd. All rights reserved.
//

import Foundation
import UIKit


public protocol Presentable: Configurable, Identifyable {
    
    var identifier: String { get }
    
}

extension Presentable {
    
}


public protocol PresentableHeader: Presentable { }

public protocol PresentableFooter: Presentable { }
