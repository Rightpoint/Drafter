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
    public func centerInContainer (withOffset offset: CGFloat = 0.0, axis:UILayoutConstraintAxis, priority:UILayoutPriority = UILayoutPriorityRequired) -> NSLayoutConstraint {

        return centerInContainer(isActive: false, toView: nil, axis: axis, offset: offset).activate(priority)
    }
}
