//
//  AlignLayoutHelpers.swift
//  Pods
//
//  Created by Derek Ostrander on 8/25/15.
//
//

import UIKit

func align(view: UIView,
    attribute: NSLayoutAttribute,
    toView view2: UIView,
    offset: CGFloat = 0.0,
    relation: NSLayoutRelation = .Equal) -> NSLayoutConstraint {
        guard let s = view.superview else {
            assert(false, kSuperviewErrorMessage)
        }
        assert(view.isDescendantOfView(s), kViewHierarchyMessage)
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
//    private func align(attribute: NSLayoutAttribute,
//        toView view: UIView,
//        offset: CGFloat = 0.0,
//        relation: NSLayoutRelation = .Equal) -> NSLayoutConstraint {
//            guard let s = superview else {
//                assert(false, kSuperviewErrorMessage)
//            }
//            assert(view.isDescendantOfView(s), kViewHierarchyMessage)
//            let constraint = NSLayoutConstraint(item: view,
//                attribute: attribute,
//                relatedBy: relation,
//                toItem: self,
//                attribute: attribute,
//                multiplier: 1.0,
//                constant: offset)
//            constraint.active = false
//            return constraint
//    }
    public func alignLeft(toLeftOfView view: UIView,
        offset: CGFloat = 0.0,
        isActive active: Bool = true,
        priority: UILayoutPriority = UILayoutPriorityRequired,
        relation: NSLayoutRelation = .Equal) -> NSLayoutConstraint {
            let constraint = align(self, attribute: .Left, toView: view, offset: offset, relation: relation)
//            let constraint = align(<#T##attribute: NSLayoutAttribute##NSLayoutAttribute#>, toView: <#T##UIView#>, offset: <#T##CGFloat#>, relation: <#T##NSLayoutRelation#>)
//            let constraint = align(view, attribute: .Left, view2: view, offset: offset, relation: relation)
            constraint.priority = priority
            constraint.active = active
            return constraint
    }

    public func alignRight(toRightOfView view: UIView,
        offset: CGFloat = 0.0,
        isActive active: Bool = true,
        priority: UILayoutPriority = UILayoutPriorityRequired,
        relation: NSLayoutRelation = .Equal) -> NSLayoutConstraint {
            let constraint = align(view, attribute: .Right, toView: self, offset: offset, relation: relation)
            constraint.priority = priority
            constraint.active = active
            return constraint
    }

    public func alignTop(toTopOfView view: UIView,
        offset: CGFloat = 0.0,
        isActive active: Bool = true,
        priority: UILayoutPriority = UILayoutPriorityRequired,
        relation: NSLayoutRelation = .Equal) -> NSLayoutConstraint {
            let constraint = align(self, attribute: .Top, toView: view, offset: offset, relation: relation)
            constraint.priority = priority
            constraint.active = active
            return constraint
    }

    public func alignBottom(toBottomOfView view: UIView,
        offset: CGFloat = 0.0,
        isActive active: Bool = true,
        priority: UILayoutPriority = UILayoutPriorityRequired,
        relation: NSLayoutRelation = .Equal) -> NSLayoutConstraint {
            let constraint = align(view, attribute: .Bottom, toView: self, offset: offset, relation: relation)
            constraint.priority = priority
            constraint.active = active
            return constraint
    }
}
