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
    func find(f: (Element) -> (Bool)) -> Element? {
        guard let index = self.indexOf(f) else {
            return nil
        }
        return self[index]
    }
}

extension NSLayoutConstraint {
    var firstObject: NSObject {
        get {
            return self.firstItem as! NSObject
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

    func activate(activePriority: UILayoutPriority) -> NSLayoutConstraint {
        priority = activePriority
        active = true
        return self
    }
}

extension UIView {
    func attributeCheck(forAttribute attribute: NSLayoutAttribute) -> (NSLayoutConstraint -> Bool) {
        let attributeCheck: (NSLayoutConstraint -> Bool)
        switch attribute {
        case .Left, .Leading:
            attributeCheck = {(constraint: NSLayoutConstraint) -> Bool in
                return (constraint.firstAttribute == .Left || constraint.firstAttribute == .Leading) && (constraint.secondAttribute == .Left || constraint.secondAttribute == .Leading)
            }
        case .Right, .Trailing:
            attributeCheck = {(constraint: NSLayoutConstraint) -> Bool in
                return (constraint.firstAttribute == .Right || constraint.firstAttribute == .Trailing) && (constraint.secondAttribute == .Right || constraint.secondAttribute == .Trailing)
            }
        case .LeftMargin, .LeadingMargin:
            attributeCheck = {(constraint: NSLayoutConstraint) -> Bool in
                return (constraint.firstAttribute == .LeftMargin || constraint.firstAttribute == .LeadingMargin) && (constraint.secondAttribute == .LeftMargin || constraint.secondAttribute == .LeadingMargin)
            }
        case .RightMargin, .TrailingMargin:
            attributeCheck = {(constraint: NSLayoutConstraint) -> Bool in
                return (constraint.firstAttribute == .RightMargin || constraint.firstAttribute == .TrailingMargin) && (constraint.secondAttribute == .RightMargin || constraint.secondAttribute == .TrailingMargin)
            }

            // Size
        case .Width:
            attributeCheck = { return $0.firstAttribute == .Width && $0.secondAttribute == .NotAnAttribute }
        case .Height:
            attributeCheck = { return $0.firstAttribute == .Height && $0.secondAttribute == .NotAnAttribute }

            // Normal
        case .Top, .Bottom, .CenterX, .CenterY, .TopMargin, .BottomMargin, .CenterXWithinMargins, .CenterYWithinMargins:
            attributeCheck = { return $0.firstAttribute == attribute && $0.secondAttribute == attribute }

        default: // Break in case
            attributeCheck = { _ -> Bool in
                assert(false, "Shouldn't get here")
                return false
            }
        }
        
        return attributeCheck
    }
}
