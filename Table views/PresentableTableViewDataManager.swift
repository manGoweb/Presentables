//
//  PresentableTableViewDataManager.swift
//  Presentables
//
//  Created by Ondrej Rafaj on 25/07/2017.
//  Copyright © 2017 manGoweb UK Ltd. All rights reserved.
//

import Foundation


open class PresentableTableViewDataManager: NSObject, TableViewPresentableManager, UITableViewDataSource, UITableViewDelegate {
    
    public var needsReloadData: (()->())?
    
    public typealias PresentableTableViewDataManagerActionInfo = (presentable: Presentable<UITableViewCell>, indexPath: IndexPath, tableView: UITableView)
    
    open var didTapCell: ((_ info: PresentableTableViewDataManagerActionInfo)->())?
    open var didTapAccessoryButton: ((_ info: PresentableTableViewDataManagerActionInfo)->())?
    
    public var bindableData: Observable<PresentableSections> = Observable([])
    public var data: PresentableSections {
        get {
            return bindableData.value
        }
        set {
            
            bindableData.value = newValue
        }
    }
    
    public var tableView: UITableView?
    
    // MARK: Data source
    
    open func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].presentables.count
    }
    
    open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let presentable = data.presentable(forIndexPath: indexPath)
        
        let identifier: String = presentable.identifier
        var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: identifier)
        if cell == nil {
            // TODO: Following needs to be made more type safe?
            tableView.register(presentable.reusableType as! UITableViewCell.Type)
            cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        }
        presentable.configure?(cell!)
        return cell!
    }
    
    open func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        // TODO: Optimise reusable code!!!! Footer is almost the same
        guard let presentable: Presentable = data.header(forSection: section) else {
            return nil
        }
        
        let identifier: String = presentable.identifier
        var view = tableView.dequeueReusableHeaderFooterView(withIdentifier: identifier)
        if view == nil {
            // TODO: Following needs to be made more type safe?
            tableView.register(presentable.reusableType as! UITableViewHeaderFooterView.Type)
            view = tableView.dequeueReusableHeaderFooterView(withIdentifier: identifier)
            guard view != nil else {
                return nil
            }
        }
        guard let v = view else {
            return nil
        }
        presentable.configure?(v)
        
        return v
    }

    open func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        // TODO: Optimise reusable code!!!! Header is almost the same
        guard let presentable: Presentable = data.footer(forSection: section) else {
            return nil
        }
        
        let identifier: String = presentable.identifier
        var view = tableView.dequeueReusableHeaderFooterView(withIdentifier: identifier)
        if view == nil {
            // TODO: Following needs to be made more type safe?
            tableView.register(presentable.reusableType as! UITableViewHeaderFooterView.Type)
            view = tableView.dequeueReusableHeaderFooterView(withIdentifier: identifier)
            guard view != nil else {
                return nil
            }
        }
        guard let v = view else {
            return nil
        }
        presentable.configure?(v)
        
        return v
    }

    // MARK: Delegate
    
    open func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if let presentable: Presentable = data.presentable(forIndexPath: indexPath) {
//            presentable.didSelectCell?()
//            didTapCell?((presentable: presentable, indexPath: indexPath, tableView: tableView))
//        }
//        else {
            let presentable: Presentable = data.presentable(forIndexPath: indexPath)
            didTapCell?((presentable: presentable, indexPath: indexPath, tableView: tableView))
//        }
    }

    open func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        let presentable: Presentable = data.presentable(forIndexPath: indexPath)
        didTapAccessoryButton?((presentable: presentable, indexPath: indexPath, tableView: tableView))
    }
    
}
