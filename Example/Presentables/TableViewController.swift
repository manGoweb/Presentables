import Presentables


class TableViewController: UITableViewController {
    
    var manager: PresentableManager = TableDataManager()
    
    
    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "UITableView"
        
        tableView.bind(withPresentableManager: &manager)
    }

}

