//
//  PrivateAutolayoutHelpers.swift
//  Pods
//
//  Created by Derek Ostrander on 8/1/15.
//
//

import UIKit

internal extension UIView {
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

    func pinSpaceToSuperview(attribute: NSLayoutAttribute, padding: CGFloat, active: Bool, priority: UILayoutPriority) -> NSLayoutConstraint
    {
        guard let s = superview else {
            assert(false, kSuperviewErrorMessage)
        }
        let isPositive = attribute != .Right && attribute != .Bottom && attribute != .RightMargin && attribute != .BottomMargin

        translatesAutoresizingMaskIntoConstraints = false

        let constraint = NSLayoutConstraint(
            item: isPositive ? self : s,
            attribute: attribute,
            relatedBy: .Equal,
            toItem: isPositive ? s : self,
            attribute: attribute,
            multiplier: 1.0,
            constant: padding)

        constraint.active = active
        return constraint
    }

    // MARK: Private
    
    private func isPinnedConstraint(constraint: NSLayoutConstraint,
        attribute: NSLayoutAttribute,
        relation: NSLayoutRelation) -> Bool {
            guard let s = superview else {
                return false
            }

            let hasCorrectAttributes: (NSLayoutConstraint -> Bool) = attributeCheck(forAttribute: attribute)
            return (constraint.firstObject == s || constraint.secondObject == s) && hasCorrectAttributes(constraint) && constraint.relation == relation
    }
}
