//
//  SizeAutolayoutHelpers.swift
//  Pods
//
//  Created by Derek Ostrander on 8/1/15.
//
//

import UIKit

public extension UIView {
    
    public var pinnedHeightConstraint {
        get {
            return getPinnedConstraint(.Height)
        }
    }

    public func pinHeight(toHeight: CGFloat, priority: UILayoutPriority = .Required) {
        let constraint = NSLayoutConstraint(
            item: self,
            attribute: .Height,
            relatedBy: .Equal,
            toItem: nil,
            attribute: .NotAnAttribute,
            multiplier: 1.0,
            constant: toHeight
        )

        addConstraint(constraint)
        return constraint
    }
}
