//
//  PrivateSizeAutolayoutHelpers.swift
//  Pods
//
//  Created by Derek Ostrander on 8/1/15.
//
//

import UIKit

internal extension UIView {
    func getSizeConstraint(attribute: NSLayoutAttribute) -> NSLayoutConstraint? {
        return get(constraints, f: { (constraint: NSLayoutConstraint) -> (Bool) in
            return constraint.firstAttribute == attribute &&
                constraint.secondAttribute == .NotAnAttribute &&
                constraint.relation == .Equal
        })
    }

    func getMaxSizeConstraint(attribute: NSLayoutAttribute) -> NSLayoutConstraint? {
        return get(constraints, f: { (constraint: NSLayoutConstraint) -> (Bool) in
            return constraint.firstAttribute == attribute &&
                constraint.secondAttribute == .NotAnAttribute &&
                constraint.relation == .LessThanOrEqual
        })
    }

    func getMinSizeConstraint(attribute: NSLayoutAttribute) -> NSLayoutConstraint? {
        return get(constraints, f: { (constraint: NSLayoutConstraint) -> (Bool) in
            return constraint.firstAttribute == attribute &&
                constraint.secondAttribute == .NotAnAttribute &&
                constraint.relation == .GreaterThanOrEqual
        })
    }
}
