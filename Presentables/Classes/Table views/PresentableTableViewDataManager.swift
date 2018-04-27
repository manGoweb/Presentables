//
//  PresentableTableViewDataManager.swift
//  Presentables
//
//  Created by Ondrej Rafaj on 25/07/2017.
//  Copyright © 2017 manGoweb UK Ltd. All rights reserved.
//

import Foundation


open class PresentableTableViewDataManager: NSObject, PresentableManager, UITableViewDataSource, UITableViewDelegate {
    
    public var needsReloadData: (()->())?
    
    public typealias PresentableTableViewDataManagerActionInfo = (presentable: PresentableType, indexPath: IndexPath, tableView: UITableView)
    
    open var selectedCell: ((_ info: PresentableTableViewDataManagerActionInfo)->())?
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
    
    // MARK: Actions
    
    open func reloadData() {
        tableView?.reloadData()
    }
    
    open func reload(section: Int) {
        tableView?.reloadSections([section], with: .none)
    }
    
    open func reload(indexPath: IndexPath) {
        tableView?.reloadRows(at: [indexPath], with: .none)
    }
    
    // MARK: Data source
    
    open func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    
    open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let presentable = data.presentable(forIndexPath: indexPath)
        
        let identifier: String = presentable.identifier
        var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: identifier)
        if cell == nil {
            // TODO: Following needs to be made more type safe?
            tableView.register(presentable.storedType, forCellReuseIdentifier: presentable.identifier)
            cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        }
        presentable.runConfigure(with: cell)
        return cell!
    }
    
    // MARK: Private helpers
    
    func tableView(_ tableView: UITableView, presentable: AnyPresentable) -> UIView? {
        let identifier: String = presentable.identifier
        var view = tableView.dequeueReusableHeaderFooterView(withIdentifier: identifier)
        if view == nil {
            tableView.register(presentable.storedType, forHeaderFooterViewReuseIdentifier: presentable.identifier)
            view = tableView.dequeueReusableHeaderFooterView(withIdentifier: identifier)
            guard view != nil else {
                return nil
            }
        }
        presentable.runConfigure(with: view)
        return view
    }
    
    // MARK: Delegate
    
    open func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let presentable: AnyPresentable = data.header(forSection: section) else {
            return nil
        }
        return self.tableView(tableView, presentable: presentable)
    }
    
    open func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return data[section].header == nil ? 0 : UITableViewAutomaticDimension
    }
    
    open func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        guard let presentable: AnyPresentable = data.footer(forSection: section) else {
            return nil
        }
        return self.tableView(tableView, presentable: presentable)
    }
    
    open func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return data[section].footer == nil ? 0 : UITableViewAutomaticDimension
    }
    
    open func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let presentable: AnyPresentable = data.presentable(forIndexPath: indexPath)
        presentable.selected?()
        selectedCell?((presentable: presentable, indexPath: indexPath, tableView: tableView))
    }

    open func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        let presentable: AnyPresentable = data.presentable(forIndexPath: indexPath)
        didTapAccessoryButton?((presentable: presentable, indexPath: indexPath, tableView: tableView))
    }
    
}
