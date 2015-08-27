//
//  CenteringDrafters.swift
//  Pods
//
//  Created by Matthew Buckley on 8/14/15.
//
//

import UIKit

public typealias PointConstraints = (x: NSLayoutConstraint, y: NSLayoutConstraint)

public extension UIView {

    // MARK: Public Interface
    public func centerInContainer(offset: CGPoint = CGPoint.zeroPoint,
        isActive active: Bool = true,
        priority: UILayoutPriority = UILayoutPriorityRequired) -> PointConstraints
    {
        let x = centerInContainer(forAxis: .Horizontal,
            offset: offset.x,
            isActive: false,
            priority: priority)
        let y = centerInContainer(forAxis: .Vertical,
            offset: offset.y,
            isActive: false,
            priority: priority)
        if active {
            NSLayoutConstraint.activateConstraints([x,y])
        }

        return (x, y)
    }

    public func centerInContainer(forAxis axis: UILayoutConstraintAxis,
        offset: CGFloat = 0.0,
        isActive active: Bool = true,
        priority: UILayoutPriority = UILayoutPriorityRequired) -> NSLayoutConstraint
    {
        let constraint = centerInContainer(axis, offset: offset)
        constraint.priority = priority
        constraint.active = active
        return constraint
    }

    // MAR: Private
    private func centerInContainer(axis: UILayoutConstraintAxis,
        offset: CGFloat = 0.0) -> NSLayoutConstraint
    {
        translatesAutoresizingMaskIntoConstraints = false

        guard let s = superview else {
            assert(false, kSuperviewErrorMessage)
        }
        let axisAttribute: NSLayoutAttribute = axis == .Horizontal ? .CenterX : .CenterY
        let constraint = NSLayoutConstraint(
            item: self,
            attribute: axisAttribute,
            relatedBy: .Equal,
            toItem: s,
            attribute: axisAttribute,
            multiplier: 1.0,
            constant: offset)

        return constraint
    }

}
