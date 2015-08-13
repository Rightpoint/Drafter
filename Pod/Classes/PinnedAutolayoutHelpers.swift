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
        let constraints = [
            pinTopSpaceToSuperview(isActive: true, withPadding: insets.top),
            pinLeftSpaceToSuperview(isActive: true, withPadding: insets.left),
            pinBottomSpaceToSuperview(isActive: true, withPadding: insets.bottom),
            pinRightSpaceToSuperview(isActive: true, withPadding: insets.right)
        ]
        return constraints.map { return $0.activate(priority) }
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