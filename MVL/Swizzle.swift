//
//  Swizzle.swift
//

import Foundation

private func _swizzleMethod(_ class_: AnyClass, _ selector1: Selector, with selector2: Selector, isClassMethod: Bool)
{
    let c: AnyClass
    if isClassMethod {
        guard let l_c = object_getClass(class_) else {
            return;
        }
        c = l_c
    }
    else {
        c = class_
    }
    
    guard let method1: Method = class_getInstanceMethod(c, selector1) else { return }
    guard let method2: Method = class_getInstanceMethod(c, selector2) else { return }
    
    if class_addMethod(c, selector1, method_getImplementation(method2), method_getTypeEncoding(method2)) {
        class_replaceMethod(c, selector2, method_getImplementation(method1), method_getTypeEncoding(method1))
    }
    else {
        method_exchangeImplementations(method1, method2)
    }
}

extension NSObject {
    @objc public func swizzleInstanceMethod(_ sel1: Selector, with sel2:Selector)
    {
        _swizzleMethod(self as! AnyClass, sel1, with: sel2, isClassMethod: false);
    }

    @objc public static func swizzleInstanceMethod(_ class_: AnyClass, _ sel1: Selector, with sel2: Selector)
    {
        _swizzleMethod(class_, sel1, with: sel2, isClassMethod: false)
    }

    @objc public static func swizzleClassMethod(_ class_: AnyClass, _ sel1: Selector, with sel2: Selector)
    {
        _swizzleMethod(class_, sel1, with: sel2, isClassMethod: true)
    }
}
