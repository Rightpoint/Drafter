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
    public func centerInContainer (forAxis axis:UILayoutConstraintAxis, offset: CGFloat = 0.0, priority:UILayoutPriority = UILayoutPriorityRequired) -> NSLayoutConstraint {

        return centerInContainer(isActive: false, axis: axis, offset: offset).activate(priority)
    }
}
