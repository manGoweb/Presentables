//
//  Holder.swift
//  Presentables
//
//  Created by Ondrej Rafaj on 12/01/2018.
//

import Foundation


public class Holder {
    
    var object: Any?
    
    func get<T>(_ type: T.Type) -> [T]? {
        return object as? [T]
    }
    
}


public class ArrayHolder {
    
    lazy var classes: [Any] = []
    
    func get<T>(_ type: T.Type) -> [T]? {
        return classes.filter({ $0 is T }) as? [T]
    }
    
}

