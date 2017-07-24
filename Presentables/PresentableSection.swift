//
//  PresentableSection.swift
//  LUIElements
//
//  Created by Ondrej Rafaj on 24/07/2017.
//  Copyright © 2017 manGoweb UK Ltd. All rights reserved.
//

import Foundation


public class PresentableSection {
    
    var header: PresentableHeader?
    var footer: PresentableFooter?
    
    var cells: [Presentable] = []
    
}

public extension Array where Element: Presentable {
    
    var section: PresentableSection {
        get {
            let section = PresentableSection()
            section.cells = self
            return section
        }
    }
    
}

class Dynamic<T> {
    
    typealias Listener = (T) -> Void
    var listener: Listener?
    
    func bind(listener: Listener?) {
        self.listener = listener
    }
    
    func bindAndFire(listener: Listener?) {
        self.listener = listener
        listener?(value)
    }
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ v: T) {
        value = v
    }
}
