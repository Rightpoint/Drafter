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
        return constraint(constraints, f: { (constraint: NSLayoutConstraint) -> (Bool) in
            return constraint.firstAttribute == attribute &&
                constraint.secondAttribute == .NotAnAttribute &&
                constraint.relation == .Equal
        })
    }

    func maxSizeConstraint(attribute: NSLayoutAttribute) -> NSLayoutConstraint? {
        return constraint(constraints, f: { (constraint: NSLayoutConstraint) -> (Bool) in
            return constraint.firstAttribute == attribute &&
                constraint.secondAttribute == .NotAnAttribute &&
                constraint.relation == .LessThanOrEqual
        })
    }

    func minSizeConstraint(attribute: NSLayoutAttribute) -> NSLayoutConstraint? {
        return constraint(constraints, f: { (constraint: NSLayoutConstraint) -> (Bool) in
            return constraint.firstAttribute == attribute &&
                constraint.secondAttribute == .NotAnAttribute &&
                constraint.relation == .GreaterThanOrEqual
        })
    }
}
