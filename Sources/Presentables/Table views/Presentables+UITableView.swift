#if !os(macOS)
import UIKit


fileprivate extension Array where Element == UITableViewCell.Type {
    
    func contains(className: AnyClass) -> Bool {
        return self.filter({$0 === className}).count > 0
    }
    
}

extension UITableView: PresentableCollectionElement {
    
    func safeReloadData() {
        if Thread.isMainThread {
            reloadData()
        } else {
            DispatchQueue.main.async { [weak self] in
                self?.reloadData()
            }
        }
    }
    
    public func bind(withPresentableManager manager: inout PresentableManager) {
        dataSource = manager as? UITableViewDataSource
        delegate = manager as? UITableViewDelegate
        
        let m = manager
        manager.bindableData.bind { [weak m] (data) in
            if let data = m?.data {
                for section: PresentableSection in data {
                    self.register(section: section)
                }
            }
            
            self.safeReloadData()
        }
        
        register(presentableSections: &manager.data)
        
        manager.needsReloadData = {
            self.safeReloadData()
        }

        if let manager = manager as? PresentableTableViewDataManager {
            manager.tableView = self
        }
    }
    
    func register(presentableSections sections: inout PresentableSections) {
        guard sections.count > 0 else {
            return
        }
        
        for  i in 0 ... (sections.count - 1) {
            let section: PresentableSection = sections[i]
            register(section: section)
        }
        
        safeReloadData()
    }
    
    // MARK: Helpers
    
    func register(section: PresentableSection) {
        DispatchQueue.global().async {
            if section.bindableHeader.listener == nil {
                section.bindableHeader.bind(listener: { (header) in
                    self.safeReloadData()
                })
            }
            if section.bindableFooter.listener == nil {
                section.bindableFooter.bind(listener: { (footer) in
                    self.safeReloadData()
                })
            }
            if section.bindablePresenters.listener == nil {
                section.bindablePresenters.bind(listener: { (presenters) in
                    self.safeReloadData()
                })
            }
        }
    }
    
}
#endif
