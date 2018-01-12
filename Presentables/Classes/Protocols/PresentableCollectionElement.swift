//
//  PresentableCollectionElement.swift
//  Presentables
//
//  Created by Ondrej Rafaj on 24/07/2017.
//  Copyright © 2017 manGoweb UK Ltd. All rights reserved.
//

import Foundation
import UIKit


public protocol PresentableCollectionElement {
    
    associatedtype PresentableManagerProtocol
    
    func bind(withPresentableManager manager: inout PresentableManagerProtocol)
    
}
