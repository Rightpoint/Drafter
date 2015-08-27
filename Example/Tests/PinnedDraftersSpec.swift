//
//  PinnedDraftersSpec.swift
//  Drafter
//
//  Created by Matthew Buckley on 8/5/15.
//  Copyright © 2015 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import Drafter

class PinnedDraftersSpec: QuickSpec {

    let superview: UIView = UIView()
    let view: UIView = UIView()
    let kInsetsDefault: UIEdgeInsets = UIEdgeInsetsMake(1.0, 2.0, 3.0, 4.0)
    let kSizeDefault: CGSize = CGSizeMake(100, 200)

    override func spec() {

        beforeSuite({
            self.superview.frame = CGRectMake(0, 0, self.kSizeDefault.width, self.kSizeDefault.height)
            self.superview.addSubview(self.view)
        })
        
        beforeEach({
            self.view.translatesAutoresizingMaskIntoConstraints = true
            expect(self.superview.constraints).to(equal([]))
        })

        afterEach({
            self.superview.removeConstraints(self.superview.constraints)
        })

        describe("PinnedDrafters", {

            context("fillContainer", {

                it("adds requisite constraints", closure: {
                    let insets = self.kInsetsDefault

                    self.view.fillContainer(insets, priority: UILayoutPriorityDefaultLow)
                    expect(self.view.translatesAutoresizingMaskIntoConstraints).to(equal(false))
                    expect(self.superview.constraints.count).to(equal(4))
                    expect(self.view.constraints.count).to(equal(0))

                    for constraint: NSLayoutConstraint in self.superview.constraints {
                        switch constraint.firstAttribute {
                        case .Top:
                            expect(constraint.constant).to(equal(self.kInsetsDefault.top))
                        case .Left:
                            expect(constraint.constant).to(equal(self.kInsetsDefault.left))
                        case .Bottom:
                            expect(constraint.constant).to(equal(self.kInsetsDefault.bottom))
                        case .Right:
                            expect(constraint.constant).to(equal(self.kInsetsDefault.right))
                        default:
                            break
                        }

                        expect(constraint.priority).to(equal(UILayoutPriorityDefaultLow))
                    }

                })

                it("Should layout it's frame correctly", closure: {
                    let totalWidth = self.kSizeDefault.width
                    let totalHeight = self.kSizeDefault.height
                    let frame = CGRect(
                        x: self.kInsetsDefault.left,
                        y: self.kInsetsDefault.top,
                        width: totalWidth - (self.kInsetsDefault.left + self.kInsetsDefault.right),
                        height: totalHeight - (self.kInsetsDefault.top + self.kInsetsDefault.bottom))
                    self.view.fillContainer(self.kInsetsDefault)
                    self.superview.setNeedsLayout()
                    self.superview.layoutIfNeeded()

                    expect(self.view.frame).to(equal(frame))
                })

                it("should get correct constraints ", closure: {
                    self.view.fillContainer(self.kInsetsDefault)
                    expect(self.view.pinnedLeftConstraint?.constant).to(equal(self.kInsetsDefault.left))
                    expect(self.view.pinnedRightConstraint?.constant).to(equal(self.kInsetsDefault.right))
                    expect(self.view.pinnedTopConstraint?.constant).to(equal(self.kInsetsDefault.top))
                    expect(self.view.pinnedBottomConstraint?.constant).to(equal(self.kInsetsDefault.bottom))
                })
            })

        })
    }
}
