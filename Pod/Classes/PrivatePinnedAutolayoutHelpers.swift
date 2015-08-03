//
//  PrivateAutolayoutHelpers.swift
//  Pods
//
//  Created by Derek Ostrander on 8/1/15.
//
//

import UIKit

extension UIView {
    func pinnedMinConstraint(attribute: NSLayoutAttribute) -> NSLayoutConstraint? {
        guard let s = superview else {
            return nil
        }

        return s.constraints.find { (c: NSLayoutConstraint) -> (Bool) in
            return self.isPinnedConstraint(c, attribute: attribute, relation: .GreaterThanOrEqual)
        }
    }

    func pinnedMaxConstraint(attribute: NSLayoutAttribute) -> NSLayoutConstraint? {
        guard let s = superview else {
            return nil
        }

        return s.constraints.find { (c: NSLayoutConstraint) -> (Bool) in
            return self.isPinnedConstraint(c, attribute: attribute, relation: .LessThanOrEqual)
        }
    }

    func pinnedConstraint(attribute: NSLayoutAttribute) -> NSLayoutConstraint? {
        guard let s = superview else {
            return nil
        }

        return s.constraints.find { (c: NSLayoutConstraint) -> (Bool) in
            return self.isPinnedConstraint(c, attribute: attribute, relation: .Equal)
        }
    }

    private func isPinnedConstraint(constraint: NSLayoutConstraint,
        attribute: NSLayoutAttribute,
        relation: NSLayoutRelation) -> Bool {
            guard let s = superview else {
                return false
            }

            guard let secondItem = constraint.secondItem as? NSObject else {
                return false
            }

            let firstItem = constraint.firstItem as! NSObject

            return (firstItem == s || secondItem == s) &&
                constraint.firstAttribute == attribute &&
                constraint.secondAttribute == attribute &&
                constraint.relation == relation
    }
}