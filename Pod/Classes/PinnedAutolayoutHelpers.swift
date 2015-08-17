//
//  TailoredSwiftAutolayoutHelpers.swift
//  Pods
//
//  Created by Derek Ostrander on 7/31/15.
//
//

import UIKit

public extension UIView {

    // MARK: Public Interface
    public func pinLeftSpaceToSuperview(withPadding padding: CGFloat = 0.0, priority: UILayoutPriority = UILayoutPriorityRequired) -> NSLayoutConstraint {
        return pinLeftSpaceToSuperview(isActive: false, withPadding: padding).activate(priority)
    }

    public func pinRightSpaceToSuperview(withPadding padding: CGFloat = 0.0, priority: UILayoutPriority = UILayoutPriorityRequired) -> NSLayoutConstraint {
        return pinRightSpaceToSuperview(isActive: false, withPadding: padding).activate(priority)
    }

    public func pinTopSpaceToSuperview(withPadding padding: CGFloat = 0.0, priority: UILayoutPriority = UILayoutPriorityRequired) -> NSLayoutConstraint {
        return pinTopSpaceToSuperview(isActive: false, withPadding: padding).activate(priority)
    }

    public func pinBottomSpaceToSuperview(withPadding padding: CGFloat = 0.0, priority: UILayoutPriority = UILayoutPriorityRequired) -> NSLayoutConstraint {
        return pinBottomSpaceToSuperview(isActive: false, withPadding: padding).activate(priority)
    }

    public func fillContainer(insets: UIEdgeInsets = UIEdgeInsetsZero, priority: UILayoutPriority = UILayoutPriorityRequired) -> [NSLayoutConstraint] {
        let constraints: [NSLayoutConstraint] = [
            pinTopSpaceToSuperview(isActive: false, withPadding: insets.top),
            pinLeftSpaceToSuperview(isActive: false, withPadding: insets.left),
            pinBottomSpaceToSuperview(isActive: false, withPadding: insets.bottom),
            pinRightSpaceToSuperview(isActive: false, withPadding: insets.right)
        ]
        (constraints as NSArray).setValue(priority, forKey: "priority")
        NSLayoutConstraint.activateConstraints(constraints)
        return constraints
    }

    // Getters

    var pinnedLeftConstraint: NSLayoutConstraint? {
        return pinnedConstraint(.Left)
    }

    var pinnedRightConstraint: NSLayoutConstraint? {
        return pinnedConstraint(.Right)
    }

    var pinnedTopConstraint: NSLayoutConstraint? {
        return pinnedConstraint(.Top)
    }

    var pinnedBottomConstraint: NSLayoutConstraint? {
        return pinnedConstraint(.Bottom)
    }
}