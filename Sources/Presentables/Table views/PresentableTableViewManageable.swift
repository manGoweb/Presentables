#if !os(macOS)
import UIKit


public protocol PresentableTableViewManageable {
    var tableView: UITableView { get }
    var presentableManager: PresentableTableViewDataManager { get }
    var data: PresentableSections { get set }
}


extension PresentableTableViewManageable {
    
    public func bind() {
        var manager: PresentableManager = presentableManager
        tableView.bind(withPresentableManager: &manager)
    }
    
}
#endif
