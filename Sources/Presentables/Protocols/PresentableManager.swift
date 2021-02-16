import Foundation


public protocol PresentableManager: class {
    
    var bindableData: Observable<PresentableSections> { get }
    var data: PresentableSections { get set }
    
    var needsReloadData: (()->())? { get set }
    
    func reloadData()
    func reload(section: Int)
    func reload(indexPath: IndexPath)
    
}
