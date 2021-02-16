import Presentables


class TableViewCell: UITableViewCell {
    
    func configure() {
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class TableViewCell1: TableViewCell {
    
    override func configure() {
        super.configure()
        
        contentView.backgroundColor = UIColor.blue
    }
    
}

class TableViewCell2: TableViewCell {
    
}

