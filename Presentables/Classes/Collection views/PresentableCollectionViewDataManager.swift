//
//  PresentableCollectionViewDataManager.swift
//  Presentables
//
//  Created by Ondrej Rafaj on 22/03/2018.
//

import Foundation


open class PresentableCollectionViewDataManager: NSObject, PresentableManager, UICollectionViewDataSource, UICollectionViewDelegate {
    
    // TODO: Can we remove this?
    public var needsReloadData: (()->())?
    public var sizeForHeaderInSection: ((_ section: Int)->(CGSize))?
    public var sizeForFooterInSection: ((_ section: Int)->(CGSize))?
    
    public typealias PresentableCollectionViewDataManagerActionInfo = (presentable: PresentableType, indexPath: IndexPath, collectionView: UICollectionView)
    
    open var selectedItem: ((_ info: PresentableCollectionViewDataManagerActionInfo)->())?
    
    public var bindableData: Observable<PresentableSections> = Observable([])
    public var data: PresentableSections {
        get {
            return bindableData.value
        }
        set {
            bindableData.value = newValue
        }
    }
    
    public var collectionView: UICollectionView?
    
    // MARK: Actions
    
    open func reloadData() {
        collectionView?.collectionViewLayout.invalidateLayout()
        collectionView?.reloadData()
    }
    
    open func reload(section: Int) {
        collectionView?.reloadSections([section])
    }
    
    open func reload(indexPath: IndexPath) {
        collectionView?.reloadItems(at: [indexPath])
    }
    
    // MARK: Data source
    
    open func numberOfSections(in collectionView: UICollectionView) -> Int {
        return data.count
    }
    
    open func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data[section].count
    }
    
    open func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let presentable = data.presentable(forIndexPath: indexPath)
        let identifier: String = presentable.identifier
        let cell: UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
        presentable.runConfigure(with: cell)
        return cell
    }
    
    open func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionElementKindSectionHeader {
            guard let presentable: AnyPresentable = data.header(forSection: indexPath.section) else {
                fatalError()
            }
            let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: presentable.identifier, for: indexPath)
            presentable.runConfigure(with: view)
            return view
        }
        else {
            guard let presentable: AnyPresentable = data.footer(forSection: indexPath.section) else {
                fatalError()
            }
            let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: presentable.identifier, for: indexPath)
            presentable.runConfigure(with: view)
            return view
        }
    }
    
    // MARK: Delegate
    
    open func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let presentable: AnyPresentable = data.presentable(forIndexPath: indexPath)
        presentable.selected?()
        selectedItem?((presentable: presentable, indexPath: indexPath, collectionView: collectionView))
    }
    
}


extension PresentableCollectionViewDataManager: UICollectionViewDelegateFlowLayout {
    
    open func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        guard let _ = data.header(forSection: section) else {
            return CGSize.zero
        }
        return sizeForHeaderInSection?(section) ?? CGSize(width: collectionView.frame.width, height: 44)
    }
    
    open func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        guard let _ = data.footer(forSection: section) else {
            return CGSize.zero
        }
        return sizeForFooterInSection?(section) ?? CGSize(width: collectionView.frame.width, height: 44)
    }

}
