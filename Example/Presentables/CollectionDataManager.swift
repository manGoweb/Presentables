import Presentables


class CollectionDataManager: PresentableCollectionViewDataManager {
    
    // MARK: Initialization
    
    override init() {
        super.init()
        
        let section = PresentableSection()
        
        for i in 2...51 {
            let presentable = Presentable<CollectionViewCell>.create({ (cell) in
                cell.titleLabel.text = "Col Id: \((i))"
            }).cellSelected {
                print("Selected: \(i)")
            }
            section.append(presentable)
        }
        
        data.append(section)
    }

}
