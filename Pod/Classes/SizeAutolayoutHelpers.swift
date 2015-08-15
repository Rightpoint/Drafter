//
//  SizeAutolayoutHelpers.swift
//  Pods
//
//  Created by Derek Ostrander on 8/1/15.
//
//

import UIKit

public extension UIView {
    var pinnedHeightConstraint: NSLayoutConstraint? {
        get {
            return sizeConstraint(.Height)
        }
    }

    var pinnedWidthConstraint: NSLayoutConstraint? {
        get {
            return sizeConstraint(.Width)
        }
    }

    func pinHeight(toHeight height: CGFloat,
        priority: UILayoutPriority = UILayoutPriorityRequired) -> NSLayoutConstraint {
            return pinHeight(isActive: false, toView: nil, height: height).activate(priority)
    }

    func pinWidth(toWidth width: CGFloat,
        priority: UILayoutPriority = UILayoutPriorityRequired) -> NSLayoutConstraint {
            return pinWidth(isActive: false, toView: nil, width: width).activate(priority)
    }
}
