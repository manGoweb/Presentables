import Foundation


public protocol PresentableCollectionElement {
    
    associatedtype PresentableManagerProtocol
    
    func bind(withPresentableManager manager: inout PresentableManagerProtocol)
    
}
