import Presentables
import SnapKit


class TableViewHeader: UITableViewHeaderFooterView {
    
    var titleLabel = UILabel()
    
    
    // MARK: Initialization
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .red
        
        contentView.addSubview(titleLabel)
        titleLabel.textColor = .white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 17)
        titleLabel.snp.makeConstraints { (make) in
            make.height.equalTo(44)
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.top.bottom.equalTo(self)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

