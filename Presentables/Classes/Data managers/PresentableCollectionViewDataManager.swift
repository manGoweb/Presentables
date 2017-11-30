//
//  PresentableCollectionViewDataManager.swift
//  Presentables
//
//  Created by Ondrej Rafaj on 30/11/2017.
//

import Foundation


open class PresentableCollectionViewDataManager: NSObject, CollectionViewPresentableManager, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    public var needsReloadData: (()->())?
    public var sizeForHeaderInSection: ((_ section: Int)->(CGSize))?
    public var sizeForFooterInSection: ((_ section: Int)->(CGSize))?
    
    public typealias PresentableCollectionViewDataManagerActionInfo = (presenter: Presenter, indexPath: IndexPath, collectionView: UICollectionView)
    
    open var didTapCell: ((_ info: PresentableCollectionViewDataManagerActionInfo)->())?
    open var didTapAccessoryButton: ((_ info: PresentableCollectionViewDataManagerActionInfo)->())?
    
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
    
    // MARK: Data source
    
    open func numberOfSections(in collectionView: UICollectionView) -> Int {
        return data.count
    }
    
    open func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data[section].presenters.count
    }
    
    open func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let presenter: Presenter = data.presenter(forIndexPath: indexPath)
        let presentable = collectionView.dequeueReusableCell(withPresenter: presenter, for: indexPath)
        return presentable
    }
    
    open func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionElementKindSectionHeader {
            let presenter: PresenterHeaderFooter? = data.header(forSection: indexPath.section)
            let presentable = collectionView.dequeueReusableHeader(withPresenter: presenter, for: indexPath)
            return presentable!
        }
        else {
            let presenter: PresenterHeaderFooter? = data.footer(forSection: indexPath.section)
            let presentable = collectionView.dequeueReusableFooter(withPresenter: presenter, for: indexPath)
            return presentable!
        }
    }
    
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
    
    // MARK: Delegate
    
    open func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let presenter: SelectablePresenter = data.presenter(forIndexPath: indexPath) as? SelectablePresenter {
            presenter.didSelectCell?()
            didTapCell?((presenter: presenter, indexPath: indexPath, collectionView: collectionView))
        }
        else {
            let presenter: Presenter = data.presenter(forIndexPath: indexPath)
            didTapCell?((presenter: presenter, indexPath: indexPath, collectionView: collectionView))
        }
    }
    
}
