//
//  SizeAutolayoutHelpers.swift
//  Pods
//
//  Created by Derek Ostrander on 8/1/15.
//
//

import UIKit

public extension UIView {
    func pinHeight(toHeight height: CGFloat,
        priority: UILayoutPriority = UILayoutPriorityRequired) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint(
            item: self,
            attribute: .Height,
            relatedBy: .Equal,
            toItem: nil,
            attribute: .NotAnAttribute,
            multiplier: 1.0,
            constant: height
        )
        constraint.priority = priority
        self.addConstraint(constraint)

        return constraint
    }

    func pinWidth(toWidth width: CGFloat,
        priority: UILayoutPriority = UILayoutPriorityRequired) -> NSLayoutConstraint {
            let constraint = NSLayoutConstraint(
                item: self,
                attribute: .Width,
                relatedBy: .Equal,
                toItem: nil,
                attribute: .NotAnAttribute,
                multiplier: 1.0,
                constant: width
            )
            constraint.priority = priority
            self.addConstraint(constraint)
            
            return constraint
    }
}
