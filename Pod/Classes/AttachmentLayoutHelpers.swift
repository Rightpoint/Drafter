//
//  AttachmentLayoutHelpers.swift
//  Pods
//
//  Created by Derek Ostrander on 8/14/15.
//
//

import UIKit

public extension UIView {
    public func attachBottom(toTopOfView view: UIView,
        withPadding padding: CGFloat = 0.0,
        isActive active: Bool = true,
        priority: UILayoutPriority = UILayoutPriorityRequired,
        relation: NSLayoutRelation = .Equal) -> NSLayoutConstraint {
            guard let s = superview else {
                assert(false, kSuperviewErrorMessage)
            }
            assert(view.isDescendantOfView(s), kViewHierarchyMessage)
            let constraint = NSLayoutConstraint(item: self, attribute: .Bottom, relatedBy: relation, toItem: view, attribute: .Top, multiplier: 1.0, constant: padding)
            constraint.priority = priority
            constraint.active = active
            return constraint
    }

    public func attachTop(toBottomOfView view: UIView,
        withPadding padding: CGFloat = 0.0,
        isActive active: Bool = true,
        priority: UILayoutPriority = UILayoutPriorityRequired,
        relation: NSLayoutRelation = .Equal) -> NSLayoutConstraint {
            guard let s = superview else {
                assert(false, kSuperviewErrorMessage)
            }
            assert(view.isDescendantOfView(s), kViewHierarchyMessage)
            let constraint = NSLayoutConstraint(item: view, attribute: .Bottom, relatedBy: relation, toItem: self, attribute: .Top, multiplier: 1.0, constant: padding)
            constraint.priority = priority
            constraint.active = active
            return constraint
    }

    public func attachRight(toLeftOfView view: UIView,
        withPadding padding: CGFloat = 0.0,
        isActive active: Bool = true,
        priority: UILayoutPriority = UILayoutPriorityRequired,
        relation: NSLayoutRelation = .Equal) -> NSLayoutConstraint {
            guard let s = superview else {
                assert(false, kSuperviewErrorMessage)
            }
            assert(view.isDescendantOfView(s), kViewHierarchyMessage)
            let constraint = NSLayoutConstraint(item: self, attribute: .Right, relatedBy: relation, toItem: view, attribute: .Left, multiplier: 1.0, constant: padding)
            constraint.priority = priority
            constraint.active = active
            return constraint
    }
    public func attachLeft(toRightOfView view: UIView,
        withPadding padding: CGFloat = 0.0,
        isActive active: Bool = true,
        priority: UILayoutPriority = UILayoutPriorityRequired,
        relation: NSLayoutRelation = .Equal) -> NSLayoutConstraint {
            guard let s = superview else {
                assert(false, kSuperviewErrorMessage)
            }
            assert(view.isDescendantOfView(s), kViewHierarchyMessage)
            let constraint = NSLayoutConstraint(item: view, attribute: .Right, relatedBy: relation, toItem: self, attribute: .Left, multiplier: 1.0, constant: padding)
            constraint.priority = priority
            constraint.active = active
            return constraint
    }
}
