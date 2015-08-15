//
//  PrivateSizeAutolayoutHelpers.swift
//  Pods
//
//  Created by Derek Ostrander on 8/1/15.
//
//

import UIKit

internal extension UIView {
    func sizeConstraint(attribute: NSLayoutAttribute) -> NSLayoutConstraint? {
        return constraints.find { (constraint: NSLayoutConstraint) -> (Bool) in
            let hasCorrectAttributes = self.attributeCheck(forAttribute: attribute)
            return hasCorrectAttributes(constraint) && constraint.relation == .Equal
        }
    }

    func maxSizeConstraint(attribute: NSLayoutAttribute) -> NSLayoutConstraint? {
        return constraints.find { (constraint: NSLayoutConstraint) -> (Bool) in
            let hasCorrectAttributes = self.attributeCheck(forAttribute: attribute)
            return hasCorrectAttributes(constraint) && constraint.relation == .LessThanOrEqual
        }
    }

    func minSizeConstraint(attribute: NSLayoutAttribute) -> NSLayoutConstraint? {
        return constraints.find { (constraint: NSLayoutConstraint) -> (Bool) in
            let hasCorrectAttributes = self.attributeCheck(forAttribute: attribute)
            return hasCorrectAttributes(constraint) && constraint.relation == .GreaterThanOrEqual
        }
    }
}
