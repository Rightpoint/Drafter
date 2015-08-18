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
        isActive active: Bool = true,
        priority: UILayoutPriority = UILayoutPriorityRequired) -> NSLayoutConstraint {
            return pinHeight(isActive: active, toView: nil, height: height, priority: priority)
    }

    func pinWidth(toWidth width: CGFloat,
        isActive active: Bool = true,
        priority: UILayoutPriority = UILayoutPriorityRequired) -> NSLayoutConstraint {
            return pinWidth(isActive: active, toView: nil, width: width, priority: priority)
    }
}
