//
//  AttachmentDrafters.swift
//  Pods
//
//  Created by Derek Ostrander on 8/14/15.
//
//

import UIKit

func draftAttachBottom(ofView view: UIView, toTopOfView view2: UIView, padding: CGFloat, relation: NSLayoutRelation) -> NSLayoutConstraint {
    guard let s = view.superview else {
        fatalError(kSuperviewErrorMessage)
    }
    assert(view2.isDescendantOfView(s), kViewHierarchyMessage)
    let constraint = NSLayoutConstraint(item: view,
        attribute: .Top,
        relatedBy: relation,
        toItem: view2,
        attribute: .Bottom,
        multiplier: 1.0,
        constant: padding)
    return constraint
}

func draftAttachLeft(ofView view: UIView, toRightOfView view2: UIView, padding: CGFloat, relation: NSLayoutRelation) -> NSLayoutConstraint {
    guard let s = view.superview else {
        fatalError(kSuperviewErrorMessage)
    }
    assert(view2.isDescendantOfView(s), kViewHierarchyMessage)
    let constraint = NSLayoutConstraint(item: view,
        attribute: .Left,
        relatedBy: relation,
        toItem: view2,
        attribute: .Right,
        multiplier: 1.0,
        constant: padding)
    return constraint
}

public extension UIView {
    public func attachBottom(toTopOfView view: UIView,
        withPadding padding: CGFloat = 0.0,
        isActive active: Bool = true,
        priority: UILayoutPriority = UILayoutPriorityRequired,
        relation: NSLayoutRelation = .Equal) -> NSLayoutConstraint
    {
        let constraint = draftAttachBottom(ofView: view,
            toTopOfView: self,
            padding: padding,
            relation: relation)
        constraint.priority = priority
        constraint.active = active
        return constraint
    }

    public func attachTop(toBottomOfView view: UIView,
        withPadding padding: CGFloat = 0.0,
        isActive active: Bool = true,
        priority: UILayoutPriority = UILayoutPriorityRequired,
        relation: NSLayoutRelation = .Equal) -> NSLayoutConstraint
    {
        let constraint = draftAttachBottom(ofView: self,
            toTopOfView: view,
            padding: padding,
            relation: relation)
        constraint.priority = priority
        constraint.active = active
        return constraint
    }

    public func attachRight(toLeftOfView view: UIView,
        withPadding padding: CGFloat = 0.0,
        isActive active: Bool = true,
        priority: UILayoutPriority = UILayoutPriorityRequired,
        relation: NSLayoutRelation = .Equal) -> NSLayoutConstraint
    {
        let constraint = draftAttachLeft(ofView: view,
            toRightOfView: self,
            padding: padding,
            relation: relation)
        constraint.priority = priority
        constraint.active = active
        return constraint
    }
    public func attachLeft(toRightOfView view: UIView,
        withPadding padding: CGFloat = 0.0,
        isActive active: Bool = true,
        priority: UILayoutPriority = UILayoutPriorityRequired,
        relation: NSLayoutRelation = .Equal) -> NSLayoutConstraint
    {
        let constraint = draftAttachLeft(ofView: self,
            toRightOfView: view,
            padding: padding,
            relation: relation)
        constraint.priority = priority
        constraint.active = active
        return constraint
    }
}
