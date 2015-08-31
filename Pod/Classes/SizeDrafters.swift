//
//  SizeDrafters.swift
//  Pods
//
//  Created by Derek Ostrander on 8/1/15.
//
//

import UIKit

public typealias SizeConstraints = (width: NSLayoutConstraint, height: NSLayoutConstraint)

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

    func pinSize(toSize size: CGSize,
        isActive active: Bool = true,
        priority: UILayoutPriority = UILayoutPriorityRequired) -> SizeConstraints {
            let height = pinHeight(toView: nil, height: size.height, isActive: false)
            let width = pinWidth(toView: nil, width: size.width, isActive: false)
            let constraints = [height, width]
            (constraints as NSArray).setValue(priority, forKey: "priority")
            if active {
                NSLayoutConstraint.activateConstraints(constraints)
            }

            return (width, height)
    }


    func pinHeight(toView view: UIView?,
        height constant: CGFloat = 0.0,
        ratio multiplier: CGFloat = 1.0,
        isActive active: Bool = true,
        priority: UILayoutPriority = UILayoutPriorityRequired) -> NSLayoutConstraint
    {
        translatesAutoresizingMaskIntoConstraints = false

        let secondAttribute: NSLayoutAttribute = view == nil ? .Height : .NotAnAttribute
        let constraint = NSLayoutConstraint(
            item: self,
            attribute: .Height,
            relatedBy: .Equal,
            toItem: view,
            attribute: secondAttribute,
            multiplier: multiplier,
            constant: constant
        )
        constraint.priority = priority
        constraint.active = active

        return constraint
    }

    func pinWidth(toView view: UIView?,
        width constant: CGFloat = 0.0,
        ratio multiplier: CGFloat = 1.0,
        isActive active: Bool = true,
        priority: UILayoutPriority = UILayoutPriorityRequired) -> NSLayoutConstraint
    {

        translatesAutoresizingMaskIntoConstraints = false

        let secondAttribute: NSLayoutAttribute = view == nil ? .Width : .NotAnAttribute
        let constraint = NSLayoutConstraint(
            item: self,
            attribute: .Width,
            relatedBy: .Equal,
            toItem: view,
            attribute: secondAttribute,
            multiplier: multiplier,
            constant: constant
        )
        constraint.priority = priority
        constraint.active = active
        
        return constraint
    }

    func pinHeight(toHeight height: CGFloat,
        isActive active: Bool = true,
        priority: UILayoutPriority = UILayoutPriorityRequired) -> NSLayoutConstraint {
            return pinHeight(toView: nil, height: height, priority: priority)
    }

    func pinWidth(toWidth width: CGFloat,
        isActive active: Bool = true,
        priority: UILayoutPriority = UILayoutPriorityRequired) -> NSLayoutConstraint {
            return pinWidth(toView: nil, width: width, priority: priority)
    }
}
