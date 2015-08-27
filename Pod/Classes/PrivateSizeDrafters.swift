//
//  PrivateSizeDrafters.swift
//  Pods
//
//  Created by Derek Ostrander on 8/1/15.
//
//

import UIKit

extension UIView {
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

    func pinHeight(isActive active: Bool,
        toView view: UIView?,
        height constant: CGFloat = 0.0,
        ratio multiplier: CGFloat = 1.0,
        priority: UILayoutPriority = UILayoutPriorityRequired) -> NSLayoutConstraint
    {
        translatesAutoresizingMaskIntoConstraints = false

        let secondAttribute: NSLayoutAttribute = view == nil ? .Height : .NotAnAttribute
        let constraint = NSLayoutConstraint(
            item: self,
            attribute: .Height,
            relatedBy: .Equal,
            toItem: view,
            attribute: secondAttribute,
            multiplier: multiplier,
            constant: constant
        )
        constraint.priority = priority
        constraint.active = active

        return constraint
    }

    func pinWidth(isActive active: Bool,
        toView view: UIView?,
        width constant: CGFloat = 0.0,
        ratio multiplier: CGFloat = 1.0,
        priority: UILayoutPriority = UILayoutPriorityRequired) -> NSLayoutConstraint
    {

        translatesAutoresizingMaskIntoConstraints = false

        let secondAttribute: NSLayoutAttribute = view == nil ? .Width : .NotAnAttribute
        let constraint = NSLayoutConstraint(
            item: self,
            attribute: .Width,
            relatedBy: .Equal,
            toItem: view,
            attribute: secondAttribute,
            multiplier: multiplier,
            constant: constant
        )
        constraint.priority = priority
        constraint.active = active

        return constraint
    }
}
