# Presentables

[![Slack](https://img.shields.io/badge/join-slack-745EAF.svg?style=flat)](http://bit.ly/2B0dEyt)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Version](https://img.shields.io/cocoapods/v/Presentables.svg?style=flat)](http://cocoapods.org/pods/Presentables)
[![License](https://img.shields.io/cocoapods/l/Presentables.svg?style=flat)](http://cocoapods.org/pods/Presentables)
[![Platform](https://img.shields.io/cocoapods/p/Presentables.svg?style=flat)](http://cocoapods.org/pods/Presentables)

## 

So what is Presentables really? It is a really small library that should help you develop apps with table views a little bit faster than you would using the conventional methods. It also introduces binding of your data to the table views so any time you change your dataset, the table will update accordingly.

> Checkout our examples for **UICollectionView** support!

## Slack

Get help using and installing this product on our [Slack](http://bit.ly/2B0dEyt), channel <b>#help-presentables</b>

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

#### Cocoapods

Presentables is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "Presentables"
```

#### Carthage

Presentables is also available through [Carthage](https://github.com/Carthage/Carthage). To install
it, simply add the following line to your Cartfile:
```ruby
github "manGoweb/Presentables"
```
## Usage

Create your cell like you would usually do

```Swift
import UIKit

class MyTableViewCell: UITableViewCell { }

```

There are two ways to use presentables
- [In a data manager](#using-data-manager)
- [In a view controller (or any other class) directly](#using-designated-view-controller)

### Using data manager

Create a data manager

```Swift
import Foundation
import Presentables


class TableDataManager: PresentableTableViewDataManager {
    
    // MARK: Initialization
    
    override init() {
        super.init()
        
	// Create a section
	let section = PresentableSection()
	
        // Create a cell with custom tap event
        let presentable = Presentable<MyTableViewCell>.create({ (cell) in
            cell.textLabel?.text = "First cell"
        })
        section.append(presentable)
        
        // Now add your section to the data source
        data.append(section)
    }
    
}
```

And lastly, bind your table view to your data manager

```Swift
import UIKit
import Presentables


class ViewController: UITableViewController {

    var manager: PresentableManager = TableDataManager()
    
    
    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.bind(withPresentableManager: &manager)
    }

}
```

or you could do a bit more ... here is a full spec data manager with all the functionality available

```Swift
import Foundation
import Presentables


class TableDataManager: PresentableTableViewDataManager {
    
    // MARK: Initialization
    
    override init() {
        super.init()
        
        // Create a section in your table view
        let section = PresentableSection()
        
        // Add a header to it
        let header = Presentable<TableViewHeader>.create { (header) in
            header.titleLabel.text = "It works :)"
        }
        section.header = header
        
        // Create a cell with custom tap event
        let presentable = Presentable<TableViewCell1>.create({ (cell) in
            cell.textLabel?.text = "First cell"
        }).cellSelected {
            print("First cell has been selected")
        }
        section.append(presentable)
        
        // And add loads more different cells
        for i in 2...51 {
            let presentable = Presentable<TableViewCell2>.create({ (cell) in
                cell.textLabel?.text = "Id: \((i))"
            })
            section.append(presentable)
        }
        
        // Now add your section to the data source
        data.append(section)
        
        // And finally create a global tap event for all cells
        selectedCell = { info in
            info.tableView.deselectRow(at: info.indexPath, animated: true)
            print("Did select cell no. \((info.indexPath.row + 1))")
        }
    }
    
    // MARK: Overriding table view delegate (optional)
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
}
```

### Using designated view controller

If you are not into creating separate manager classes, you can use our pre-set view controller directly like this:

```swift
class ManagerTableViewController: PresentableTableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create a section
        let section = PresentableSection()
        
        // Build a header
        let header = Presentable<TableViewHeader>.create { (header) in
            header.titleLabel.text = "It works yet again!"
        }
        section.header = header
        
        // Add a cell!
        let presentable = Presentable<TableViewCell2>.create({ (cell) in
            cell.textLabel?.text = "Custom cell"
        })
        section.append(presentable)
        
        data.append(section)
    }
    
}
```

I don't think it can get simpler than that ...

In case you'd like to implement your own version of a `ManagerTableViewController` (or any other class or view on that matter), you could use `PresentableTableViewManageable` like this:

```swift
open class MyTableViewController: UIViewController, PresentableTableViewManageable {
    
    public var tableView = UITableView(frame: CGRect.zero, style: .plain)
    
    public let presentableManager = PresentableTableViewDataManager()
    
    public var data: PresentableSections {
        get { return presentableManager.data }
        set { presentableManager.data = newValue }
    }
    
    // MARK: View lifecycle
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { ... }
        
        bind()
    }
    
}
```


## Author

Ondrej Rafaj, dev@mangoweb.cz

## License

Presentables is available under the MIT license. See the LICENSE file for more info.
