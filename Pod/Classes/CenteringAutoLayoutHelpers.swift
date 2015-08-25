//
//  CenteringAutoLayoutHelpers.swift
//  Pods
//
//  Created by Matthew Buckley on 8/14/15.
//
//

import UIKit

public extension UIView {

    // MARK: Public Interface
    public func centerInContainer(offset: CGPoint = CGPoint.zeroPoint,
        isActive active: Bool = true,
        priority:UILayoutPriority = UILayoutPriorityRequired) -> (x: NSLayoutConstraint, y: NSLayoutConstraint) {
            let x = centerInContainer(forAxis: .Horizontal, offset: offset.x, isActive: false, priority: priority)
            let y = centerInContainer(forAxis: .Vertical, offset: offset.y, isActive: false, priority: priority)
            if active {
                NSLayoutConstraint.activateConstraints([x,y])
            }

            return (x, y)
    }

    public func centerInContainer(forAxis axis:UILayoutConstraintAxis,
        offset: CGFloat = 0.0,
        isActive active: Bool = true,
        priority:UILayoutPriority = UILayoutPriorityRequired) -> NSLayoutConstraint {
            let constraint = centerInContainer(isActive: false, axis: axis, offset: offset).activate(priority)
            constraint.priority = priority
            constraint.active = active
            return constraint
    }
}
