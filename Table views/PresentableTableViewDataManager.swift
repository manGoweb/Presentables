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
    
    public typealias PresentableTableViewDataManagerActionInfo = (presentable: PresentableCell, indexPath: IndexPath, tableView: UITableView)
    
//    open var didTapCell: ((_ info: PresentableTableViewDataManagerActionInfo)->())?
//    open var didTapAccessoryButton: ((_ info: PresentableTableViewDataManagerActionInfo)->())?
    
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
        
        guard presentable.reusableType is UITableViewCell else {
            fatalError("Presentable class needs to have type UITableViewCell")
        }
        
        let identifier: String = presentable.identifier
        var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: identifier)
        if cell == nil {
            // TODO: Following needs to be made more type safe?
            tableView.register(presentable.reusableType as! UITableViewCell)
            cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        }
        presentable.configure?(cell!)
        return cell!
    }
    
//    open func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        // TODO: Optimise reusable code!!!! Footer is almost the same
//
//        guard let presentable = data.header(forSection: section) else {
//            return nil
//        }
//
//        guard presentable.
//
//        let identifier: String = presentable.identifier
//        var view = tableView.dequeueReusableHeaderFooterView(withIdentifier: identifier)
//        if view == nil {
//            // TODO: Does the following needs to be made more type safe?
//            tableView.register(presentable.reusableType)
//            view = tableView.dequeueReusableHeaderFooterView(withIdentifier: identifier)
//            guard view != nil else {
//                return nil
//            }
//        }
//        guard let v = view else {
//            return nil
//        }
//        presentable.configure?(v)
//
//        return nil
//    }
//
//    open func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        // TODO: Optimise reusable code!!!! Header is almost the same
//        guard let presentable = data.footer(forSection: section) as? PresentableFooter<UITableViewHeaderFooterView> else {
//            return nil
//        }
//
//        let identifier: String = presentable.identifier
//        var view = tableView.dequeueReusableHeaderFooterView(withIdentifier: identifier)
//        if view == nil {
//            // TODO: Does the following needs to be made more type safe?
//            tableView.register(presentable.reusableType)
//            view = tableView.dequeueReusableHeaderFooterView(withIdentifier: identifier)
//            guard view != nil else {
//                return nil
//            }
//        }
//        guard let v = view else {
//            return nil
//        }
//        presentable.configure?(v)
//
//        return v
//    }
//
//    open func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        guard let _ = data.header(forSection: section) as? PresentableHeader<UITableViewHeaderFooterView> else {
//            return 0
//        }
//        return UITableViewAutomaticDimension
//    }
//
//    open func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        guard let _ = data.footer(forSection: section) as? PresentableFooter<UITableViewHeaderFooterView> else {
//            return 0
//        }
//        return UITableViewAutomaticDimension
//    }

    // MARK: Delegate
    
    open func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let presentable = data.presentable(forIndexPath: indexPath)
        let sections: PresentableSections = data.sectionsOrError()
        let presentable = sections[indexPath.section].presentables[indexPath.row]
        presentable.selected?()
        didTapCell?((presentable: presentable, indexPath: indexPath, tableView: tableView))
    }

    open func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        let presentable = data.presentable(forIndexPath: indexPath)
        didTapAccessoryButton?((presentable: presentable, indexPath: indexPath, tableView: tableView))
    }
    
}
