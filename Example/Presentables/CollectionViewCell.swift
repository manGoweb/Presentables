import Presentables
import SnapKit


class CollectionViewCell: UICollectionViewCell {
    
    let titleLabel = UILabel()
    
    func configure() {
        contentView.backgroundColor = .white
        
        contentView.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        titleLabel.textColor = .black
        titleLabel.textAlignment = .center
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

