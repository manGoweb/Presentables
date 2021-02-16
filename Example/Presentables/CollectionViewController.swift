import Presentables


class CollectionViewController: UICollectionViewController {
    
    var manager: PresentableManager = CollectionDataManager()
    
    
    // MARK: Initialization
    
    init() {
        // Setup your layout
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100, height: 50)
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        title = "UICollectionView"
        
        // Unlike with table views, you have to register your cells
        collectionView?.register(CollectionViewCell.self)
        
        collectionView?.bind(withPresentableManager: &manager)
    }
    
}
