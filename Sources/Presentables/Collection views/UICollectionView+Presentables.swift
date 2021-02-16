#if !os(macOS)
import UIKit


extension UICollectionView {
    
    open func register<T>(_ cellClass: T.Type) where T: UICollectionViewCell {
        let identifier = String(describing: T.self)
        register(cellClass, forCellWithReuseIdentifier: identifier)
    }
    
    open func register<T>(header viewClass: T.Type) where T: UICollectionReusableView {
        let identifier = String(describing: T.self)
        register(viewClass, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: identifier)
    }
    
    open func register<T>(footer viewClass: T.Type) where T: UICollectionReusableView {
        let identifier = String(describing: T.self)
        register(viewClass, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: identifier)
    }
    
}
#endif
