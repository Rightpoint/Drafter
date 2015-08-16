//
//  CreatorAutolayoutHelpers.swift
//  Pods
//
//  Created by Derek Ostrander on 8/8/15.
//
//

import UIKit

public extension UIView
{
    func pinLeftSpaceToSuperview(isActive active: Bool, withPadding padding: CGFloat = 0.0) -> NSLayoutConstraint
    {
        guard let s = superview else {
            assert(false, kSuperviewErrorMessage)
        }

        translatesAutoresizingMaskIntoConstraints = false

        let constraint = NSLayoutConstraint(
            item: self,
            attribute: .Left,
            relatedBy: .Equal,
            toItem: s,
            attribute: .Left,
            multiplier: 1.0,
            constant: padding)

        constraint.active = active

        return constraint
    }

    public func pinRightSpaceToSuperview(isActive active: Bool, withPadding padding: CGFloat = 0.0) -> NSLayoutConstraint
    {
        guard let s = superview else {
            assert(false, kSuperviewErrorMessage)
        }

        translatesAutoresizingMaskIntoConstraints = false

        let constraint = NSLayoutConstraint(
            item: s,
            attribute: .Right,
            relatedBy: .Equal,
            toItem: self,
            attribute: .Right,
            multiplier: 1.0,
            constant: padding)

        constraint.active = active
        return constraint
    }

    public func pinTopSpaceToSuperview(isActive active: Bool, withPadding padding: CGFloat = 0.0) -> NSLayoutConstraint
    {
        guard let s = superview else {
            assert(false, kSuperviewErrorMessage)
        }

        translatesAutoresizingMaskIntoConstraints = false

        let constraint = NSLayoutConstraint(
            item: self,
            attribute: .Top,
            relatedBy: .Equal,
            toItem: s,
            attribute: .Top,
            multiplier: 1.0,
            constant: padding)

        constraint.active = active
        return constraint
    }

    public func pinBottomSpaceToSuperview(isActive active: Bool, withPadding padding: CGFloat = 0.0) -> NSLayoutConstraint
    {
        guard let s = superview else {
            assert(false, kSuperviewErrorMessage)
        }

        translatesAutoresizingMaskIntoConstraints = false

        let constraint = NSLayoutConstraint(
            item: s,
            attribute: .Bottom,
            relatedBy: .Equal,
            toItem: self,
            attribute: .Bottom,
            multiplier: 1.0,
            constant: padding)

        constraint.active = active
        return constraint
    }

    func pinHeight(isActive active: Bool,
        toView view: UIView?,
        height constant: CGFloat = 0.0,
        ratio multiplier: CGFloat = 1.0) -> NSLayoutConstraint {

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
            constraint.active = active

            return constraint
    }

    func pinWidth(isActive active: Bool,
        toView view: UIView?,
        width constant: CGFloat = 0.0,
        ratio multiplier: CGFloat = 1.0) -> NSLayoutConstraint {

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
            constraint.active = active
            
            return constraint
    }

    func centerInContainer(isActive active: Bool, axis: UILayoutConstraintAxis, offset: CGFloat = 0.0) -> NSLayoutConstraint {

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

        constraint.active = active

        return constraint
    }
}
