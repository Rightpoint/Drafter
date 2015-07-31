//
//  TailoredSwiftAutolayoutHelpers.swift
//  Pods
//
//  Created by Derek Ostrander on 7/31/15.
//
//

import UIKit

let kSuperviewErrorMessage = "Must have superview"

extension UIView {

    // MARK: Public Interface

    public func pinLeftSpaceToSuperview(withPadding padding: CGFloat = 0.0, priority: UILayoutPriority = UILayoutPriorityRequired) -> NSLayoutConstraint {
        guard let s = superview else {
            assert(false, kSuperviewErrorMessage)
        }

        let constraint = NSLayoutConstraint(
            item: self,
            attribute: .Left,
            relatedBy: .Equal,
            toItem: superview,
            attribute: .Left,
            multiplier: 1.0,
            constant: padding)
        constraint.priority = priority
        s.addConstraint(constraint)

        return constraint
    }

    public func pinRightSpaceToSuperview(withPadding padding: CGFloat = 0.0, priority: UILayoutPriority = UILayoutPriorityRequired) -> NSLayoutConstraint {
        guard let s = superview else {
            assert(false, kSuperviewErrorMessage)
        }

        let constraint = NSLayoutConstraint(
            item: self,
            attribute: .Right,
            relatedBy: .Equal,
            toItem: superview,
            attribute: .Right,
            multiplier: 1.0,
            constant: -padding
        )
        constraint.priority = priority
        s.addConstraint(constraint)

        return constraint
    }

    public func pinTopSpaceToSuperview(withPadding padding: CGFloat = 0.0, priority: UILayoutPriority = UILayoutPriorityRequired) -> NSLayoutConstraint {
        guard let s = superview else {
            assert(false, kSuperviewErrorMessage)
        }

        let constraint = NSLayoutConstraint(
            item: self,
            attribute: .Top,
            relatedBy: .Equal,
            toItem: superview,
            attribute: .Top,
            multiplier: 1.0,
            constant: padding
        )
        constraint.priority = priority
        s.addConstraint(constraint)

        return constraint
    }


    public func pinBottomSpaceToSuperview(withPadding padding: CGFloat = 0.0, priority: UILayoutPriority = UILayoutPriorityRequired) -> NSLayoutConstraint {
        guard let s = superview else {
            assert(false, kSuperviewErrorMessage)
        }

        let constraint = NSLayoutConstraint(
            item: self,
            attribute: .Bottom,
            relatedBy: .Equal,
            toItem: superview,
            attribute: .Top,
            multiplier: 1.0,
            constant: -padding
        )
        constraint.priority = priority
        s.addConstraint(constraint)

        return constraint
    }

    // Getters

    var pinnedLeftConstraint: NSLayoutConstraint? {
        return pinnedConstraint(.Left)
    }

    var pinnedRightConstraint: NSLayoutConstraint? {
        return pinnedConstraint(.Right)
    }

    var pinnedTopConstraint: NSLayoutConstraint? {
        return pinnedConstraint(.Top)
    }

    var pinnedBottomConstraint: NSLayoutConstraint? {
        return pinnedConstraint(.Bottom)
    }

    // MARK: Private Interface

    // Helpers

    private func pinnedMinConstraint(attribute: NSLayoutAttribute) -> NSLayoutConstraint? {
        var constraint: NSLayoutConstraint?

        for c in constraints {
            if c.firstAttribute == attribute && c.secondAttribute == attribute && c.relation == .GreaterThanOrEqual {
                constraint = c
                break
            }
        }

        return constraint
    }

    private func pinnedMaxConstraint(attribute: NSLayoutAttribute) -> NSLayoutConstraint? {
        var constraint: NSLayoutConstraint?

        for c in constraints {
            if c.firstAttribute == attribute && c.secondAttribute == attribute && c.relation == .LessThanOrEqual {
                constraint = c
                break
            }
        }

        return constraint
    }

    private func pinnedConstraint(attribute: NSLayoutAttribute) -> NSLayoutConstraint? {
        var constraint: NSLayoutConstraint?

        for c in constraints {
            if c.firstAttribute == attribute && c.secondAttribute == attribute && c.relation == .Equal {
                constraint = c
                break
            }
        }
        
        return constraint
    }
}