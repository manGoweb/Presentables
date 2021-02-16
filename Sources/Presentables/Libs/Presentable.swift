#if !os(macOS)
import UIKit

public typealias ViewType = UIView

#else
import AppKit

public typealias ViewType = NSView

#endif


public protocol AnyPresentable {
    
    var identifier: String { get }
    var storedType: AnyClass { get }
    var selected: (() -> Void)? { get set }
    
    func runConfigure(with: ViewType?)
    
}


open class Presentable<PresentableType>: AnyPresentable {
    
    public typealias ConfigureClosure = (PresentableType) -> Void
    
    public typealias PresentableItem = PresentableType
    public var configure: ConfigureClosure?
    
    open var identifier: String {
        return String(describing: PresentableType.self)
    }
    
    public var reusableType: PresentableType.Type {
        return PresentableType.self
    }
    
    public var storedType: AnyClass {
        return PresentableType.self as! AnyClass
    }
    
    public var selected: (() -> Void)?
    @discardableResult public func cellSelected(_ selected: @escaping () -> Void) -> Self {
        self.selected = selected
        return self
    }
    
    public static func create(_ configure: ConfigureClosure? = nil) -> Presentable<PresentableType> {
        let presentable = Presentable<PresentableType>()
        presentable.configure = configure
        return presentable
    }
    
    public func runConfigure(with view: ViewType?) {
        guard let view: PresentableType = view as? PresentableType else {
            return
        }
        configure?(view)
    }
    
}
