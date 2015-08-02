//
//  PrivateAutolayoutHelpers.swift
//  Pods
//
//  Created by Derek Ostrander on 8/1/15.
//
//

import UIKit

internal extension UIView {
    func getPinnedMinConstraint(attribute: NSLayoutAttribute) -> NSLayoutConstraint? {
        return get(constraints, f: { (c: NSLayoutConstraint) -> (Bool) in
            return self.isPinnedConstraint(c) &&
                c.firstAttribute == attribute &&
                c.secondAttribute == attribute &&
                c.relation == .GreaterThanOrEqual
        })
    }

    func getPinnedMaxConstraint(attribute: NSLayoutAttribute) -> NSLayoutConstraint? {
        return get(constraints, f: { (c: NSLayoutConstraint) -> (Bool) in
                return self.isPinnedConstraint(c) &&
                    c.firstAttribute == attribute &&
                    c.secondAttribute == attribute &&
                    c.relation == .LessThanOrEqual
        })
    }

    func getPinnedConstraint(attribute: NSLayoutAttribute) -> NSLayoutConstraint? {
        return get(constraints, f: { (c: NSLayoutConstraint) -> (Bool) in
                return self.isPinnedConstraint(c) &&
                    c.firstAttribute == attribute &&
                    c.secondAttribute == attribute &&
                    c.relation == .Equal
        })
    }

    private func isPinnedConstraint(constraint: NSLayoutConstraint) -> Bool {
        guard let s = superview else {
            return false
        }

        guard let secondItem = constraint.secondItem as? NSObject else {
            return false
        }

        let firstItem = constraint.firstItem as! NSObject
        
        return (firstItem == self || secondItem == self) &&
            (firstItem == s || secondItem == s)
    }
}