//
//  AlignLayoutHelpers.swift
//  Pods
//
//  Created by Derek Ostrander on 8/25/15.
//
//

import UIKit

func draftAlign(view: UIView,
    attribute: NSLayoutAttribute,
    toView view2: UIView,
    offset: CGFloat = 0.0,
    relation: NSLayoutRelation = .Equal) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint(item: view,
            attribute: attribute,
            relatedBy: relation,
            toItem: view2,
            attribute: attribute,
            multiplier: 1.0,
            constant: offset)
        constraint.active = false
        return constraint
}

public extension UIView {
    public func align(subviews subviews: [UIView],
        attribute: NSLayoutAttribute,
        offset: CGFloat = 0.0,
        isActive active: Bool = true,
        priority: UILayoutPriority = UILayoutPriorityRequired,
        relation: NSLayoutRelation = .Equal) -> [NSLayoutConstraint] {
            let isPositive: Bool = (attribute == .Bottom || attribute == .Right)
            var constraints: [NSLayoutConstraint] = []
            for var i = 1; i < subviews.count; i++ {
                let view = isPositive ? subviews[i - 1] : subviews[i]
                let view2 = isPositive ? subviews[i] : subviews[i - 1]
                let constraint = draftAlign(view,
                    attribute: attribute,
                    toView: view2,
                    offset: offset,
                    relation: relation)
                constraints.append(constraint)
            }

            if active {
                NSLayoutConstraint.activateConstraints(constraints)
            }

            return constraints
    }

    public func alignLeft(toLeftOfView view: UIView,
        offset: CGFloat = 0.0,
        isActive active: Bool = true,
        priority: UILayoutPriority = UILayoutPriorityRequired,
        relation: NSLayoutRelation = .Equal) -> NSLayoutConstraint {
            let constraint = draftAlign(self, attribute: .Left, toView: view, offset: offset, relation: relation)
            constraint.priority = priority
            constraint.active = active
            return constraint
    }

    public func alignRight(toRightOfView view: UIView,
        offset: CGFloat = 0.0,
        isActive active: Bool = true,
        priority: UILayoutPriority = UILayoutPriorityRequired,
        relation: NSLayoutRelation = .Equal) -> NSLayoutConstraint {
            let constraint = draftAlign(view, attribute: .Right, toView: self, offset: offset, relation: relation)
            constraint.priority = priority
            constraint.active = active
            return constraint
    }

    public func alignTop(toTopOfView view: UIView,
        offset: CGFloat = 0.0,
        isActive active: Bool = true,
        priority: UILayoutPriority = UILayoutPriorityRequired,
        relation: NSLayoutRelation = .Equal) -> NSLayoutConstraint {
            let constraint = draftAlign(self, attribute: .Top, toView: view, offset: offset, relation: relation)
            constraint.priority = priority
            constraint.active = active
            return constraint
    }

    public func alignBottom(toBottomOfView view: UIView,
        offset: CGFloat = 0.0,
        isActive active: Bool = true,
        priority: UILayoutPriority = UILayoutPriorityRequired,
        relation: NSLayoutRelation = .Equal) -> NSLayoutConstraint {
            let constraint = draftAlign(view, attribute: .Bottom, toView: self, offset: offset, relation: relation)
            constraint.priority = priority
            constraint.active = active
            return constraint
    }
}
