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
    func pinLeftSpaceToSuperview(withPadding padding: CGFloat = 0.0,
        isActive active: Bool = true,
        priority: UILayoutPriority = UILayoutPriorityRequired) -> NSLayoutConstraint
    {
        return pinSpaceToSuperview(.Left, padding: padding, active: active, priority: priority)
    }

    public func pinRightSpaceToSuperview(withPadding padding: CGFloat = 0.0,
        isActive active: Bool = true,
        priority: UILayoutPriority = UILayoutPriorityRequired) -> NSLayoutConstraint
    {
        return pinSpaceToSuperview(.Right, padding: padding, active: active, priority: priority)
    }

    public func pinTopSpaceToSuperview(withPadding padding: CGFloat = 0.0,
        isActive active: Bool = true,
        priority: UILayoutPriority = UILayoutPriorityRequired) -> NSLayoutConstraint
    {
        return pinSpaceToSuperview(.Top, padding: padding, active: active, priority: priority)
    }

    public func pinBottomSpaceToSuperview(withPadding padding: CGFloat = 0.0,
        isActive active: Bool = true,
        priority: UILayoutPriority = UILayoutPriorityRequired) -> NSLayoutConstraint
    {
        return pinSpaceToSuperview(.Bottom, padding: padding, active: active, priority: priority)
    }

    public func fillContainer(insets: UIEdgeInsets = UIEdgeInsetsZero,
        priority: UILayoutPriority = UILayoutPriorityRequired) -> [NSLayoutConstraint] {
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
