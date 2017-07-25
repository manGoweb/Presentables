//
//  Bindable.swift
//  LUIElements
//
//  Created by Ondrej Rafaj on 24/07/2017.
//  Copyright © 2017 manGoweb UK Ltd. All rights reserved.
//

import Foundation
import UIKit


public protocol Bindable {
    
    func register(presentableSections sections: inout [PresentableSection])
    
}

