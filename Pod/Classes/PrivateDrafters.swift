//
//  PrivateAutolayoutHelpers.swift
//  Pods
//
//  Created by Derek Ostrander on 8/1/15.
//
//

import UIKit

let kSuperviewErrorMessage = "Must have superview"
let kViewHierarchyMessage = "Must be in the same view hierarchy"

extension Array {
    func find(f: (Element) -> (Bool)) -> Element?
    {
        guard let index = self.indexOf(f) else {
            return nil
        }
        return self[index]
    }
}

extension NSLayoutConstraint {
    var firstObject: NSObject {
        get {
            return (self.firstItem as? NSObject)!
        }
    }

    var secondObject: NSObject? {
        get {
            guard let secondItem = self.secondItem as? NSObject else {
                return nil
            }
            return secondItem
        }
    }
}

extension UIView {

    func attributeCheck(forAttribute attribute: NSLayoutAttribute) -> (NSLayoutConstraint -> Bool)
    {
        let attributeCheck: (NSLayoutConstraint -> Bool)
        switch attribute
        {
        case .Top, .Bottom, .CenterX, .CenterY,
        .TopMargin, .BottomMargin, .CenterXWithinMargins, .CenterYWithinMargins:
            attributeCheck = { $0.firstAttribute == attribute && $0.secondAttribute == attribute }
        case .Left, .Leading:
            attributeCheck = leftAttributeCheck()
        case .Right, .Trailing:
            attributeCheck = rightAttributeCheck()
        case .LeftMargin, .LeadingMargin:
            attributeCheck = leftMarginAttributeCheck()
        case .RightMargin, .TrailingMargin:
            attributeCheck =  rightMarginAttributeCheck()
        case .Width, .Height:
            attributeCheck = sizeAttributeCheck(attribute)
        default: // Break in case
            attributeCheck = { _ -> Bool in
                assert(false, "Shouldn't get here")
                return false
            }
        }
        return attributeCheck
    }

    // left
    private func leftAttributeCheck() -> (NSLayoutConstraint -> Bool)
    {
        return { (c: NSLayoutConstraint) -> Bool in
            (c.firstAttribute == .Left || c.firstAttribute == .Leading) &&
                (c.secondAttribute == .Left || c.secondAttribute == .Leading)
        }
    }

    private func leftMarginAttributeCheck() -> (NSLayoutConstraint -> Bool)
    {
        return { (c: NSLayoutConstraint) -> Bool in
            (c.firstAttribute == .LeftMargin || c.firstAttribute == .LeadingMargin) &&
                (c.secondAttribute == .LeftMargin || c.secondAttribute == .LeadingMargin)
        }
    }

    // right
    private func rightAttributeCheck() -> (NSLayoutConstraint -> Bool)
    {
        return { (c: NSLayoutConstraint) -> Bool in
            (c.firstAttribute == .Right || c.firstAttribute == .Trailing) &&
                (c.secondAttribute == .Right || c.secondAttribute == .Trailing)
        }
    }

    private func rightMarginAttributeCheck() -> (NSLayoutConstraint -> Bool)
    {
        return { (c: NSLayoutConstraint) -> Bool in
            (c.firstAttribute == .RightMargin || c.firstAttribute == .TrailingMargin) &&
                (c.secondAttribute == .RightMargin || c.secondAttribute == .TrailingMargin)
        }
    }

    private func sizeAttributeCheck(attribute: NSLayoutAttribute) -> (NSLayoutConstraint -> Bool)
    {
        return {
            $0.firstAttribute == attribute && $0.secondAttribute == .NotAnAttribute
        }
    }

}
