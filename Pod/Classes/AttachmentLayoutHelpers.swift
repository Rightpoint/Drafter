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
            let constraint = NSLayoutConstraint(item: view, attribute: .Top, relatedBy: relation, toItem: self, attribute: .Bottom, multiplier: 1.0, constant: padding)
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
            let constraint = NSLayoutConstraint(item: self, attribute: .Top, relatedBy: relation, toItem: view, attribute: .Bottom, multiplier: 1.0, constant: padding)
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
            let constraint = NSLayoutConstraint(item: view, attribute: .Left, relatedBy: relation, toItem: self, attribute: .Right, multiplier: 1.0, constant: padding)
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
            let constraint = NSLayoutConstraint(item: self, attribute: .Left, relatedBy: relation, toItem: view, attribute: .Right, multiplier: 1.0, constant: padding)
            constraint.priority = priority
            constraint.active = active
            return constraint
    }
}
