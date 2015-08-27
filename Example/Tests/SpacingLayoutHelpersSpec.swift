//
//  SpacingLayoutHelpers.swift
//  TailoredSwiftAutoLayoutHelpers
//
//  Created by Derek Ostrander on 8/23/15.
//  Copyright © 2015 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import TailoredSwiftAutoLayoutHelpers

class SpacingLayoutHelpersSpec: QuickSpec {

    let superview = UIView()
    let subviews = [UIView(), UIView(), UIView(), UIView()]
    let kSpaceDefault: CGFloat = 20.0
    let kSizeDefault: CGSize = CGSizeMake(50, 50)
    let kSuperSizeDefault: CGSize = CGSizeMake(600, 600)


    override func spec() {

        beforeSuite({
            self.superview.frame = CGRectMake(0, 0, self.kSuperSizeDefault.width, self.kSuperSizeDefault.height)
            for view in self.subviews {
                self.superview.addSubview(view)
            }
        })

        beforeEach({
            self.superview.translatesAutoresizingMaskIntoConstraints = true
            for view in self.subviews {
                view.translatesAutoresizingMaskIntoConstraints = true
                view.pinSize(toSize: self.kSizeDefault)
            }
            expect(self.superview.constraints).to(equal([]))
        })

        afterEach({
            self.superview.removeConstraints(self.superview.constraints)
        })

        context("Forward Spacing Tests") {
            describe("Adding Tests") {
                it("adds correct horizontal constraints", closure: {
                    let constraints = self.superview.space(subviews: self.subviews, alongAxis: .Horizontal, withPadding: self.kSpaceDefault)
                    expect(constraints.count).to(equal(self.subviews.count-1))

                    var constraint = constraints[0]
                    expect(constraint.firstAttribute).to(equal(NSLayoutAttribute.Left))
                    expect(constraint.secondAttribute).to(equal(NSLayoutAttribute.Right))
                    expect(constraint.constant).to(equal(self.kSpaceDefault))
                    expect(constraint.active).to(equal(true))

                    constraint = constraints[1]
                    expect(constraint.firstAttribute).to(equal(NSLayoutAttribute.Left))
                    expect(constraint.secondAttribute).to(equal(NSLayoutAttribute.Right))
                    expect(constraint.constant).to(equal(self.kSpaceDefault))
                    expect(constraint.active).to(equal(true))

                    constraint = constraints[2]
                    expect(constraint.firstAttribute).to(equal(NSLayoutAttribute.Left))
                    expect(constraint.secondAttribute).to(equal(NSLayoutAttribute.Right))
                    expect(constraint.constant).to(equal(self.kSpaceDefault))
                    expect(constraint.active).to(equal(true))
                })

                it("adds left vertical constraint", closure: {
                    let constraints = self.superview.space(subviews: self.subviews, alongAxis: .Vertical, withPadding: self.kSpaceDefault)
                    expect(constraints.count).to(equal(self.subviews.count-1))

                    var constraint = constraints[0]
                    expect(constraint.firstAttribute).to(equal(NSLayoutAttribute.Top))
                    expect(constraint.secondAttribute).to(equal(NSLayoutAttribute.Bottom))
                    expect(constraint.constant).to(equal(self.kSpaceDefault))
                    expect(constraint.active).to(equal(true))

                    constraint = constraints[1]
                    expect(constraint.firstAttribute).to(equal(NSLayoutAttribute.Top))
                    expect(constraint.secondAttribute).to(equal(NSLayoutAttribute.Bottom))
                    expect(constraint.constant).to(equal(self.kSpaceDefault))
                    expect(constraint.active).to(equal(true))

                    constraint = constraints[2]
                    expect(constraint.firstAttribute).to(equal(NSLayoutAttribute.Top))
                    expect(constraint.secondAttribute).to(equal(NSLayoutAttribute.Bottom))
                    expect(constraint.constant).to(equal(self.kSpaceDefault))
                    expect(constraint.active).to(equal(true))
                })
            }

            describe("Layout Tests") {
                it("should layout horiontally", closure: {
                    self.subviews[0].pinLeftSpaceToSuperview()

                    for view in self.subviews {
                        view.pinTopSpaceToSuperview()
                    }

                    self.superview.space(subviews: self.subviews, alongAxis: .Horizontal, withPadding: self.kSpaceDefault)

                    self.superview.setNeedsLayout()
                    self.superview.layoutIfNeeded()

                    for var i = 0; i <  self.subviews.count - 1; i++ {
                        let view = self.subviews[i]
                        let view2 = self.subviews[i+1]
                        let xDiff: CGFloat = CGRectGetMinX(view2.frame) - CGRectGetMaxX(view.frame)
                        expect(xDiff).to(equal(self.kSpaceDefault))
                    }
                })

                it("should layout vertically", closure: {
                    self.subviews[0].pinTopSpaceToSuperview()

                    for view in self.subviews {
                        view.pinLeftSpaceToSuperview()
                    }

                    self.superview.space(subviews: self.subviews, alongAxis: .Vertical, withPadding: self.kSpaceDefault)

                    self.superview.setNeedsLayout()
                    self.superview.layoutIfNeeded()

                    for var i = 0; i <  self.subviews.count - 1; i++ {
                        let view = self.subviews[i]
                        let view2 = self.subviews[i+1]
                        let yDiff: CGFloat = CGRectGetMinY(view2.frame) - CGRectGetMaxY(view.frame)
                        expect(yDiff).to(equal(self.kSpaceDefault))
                    }
                })
            }
        }

        context("Backward Spacing Tests") {
            describe("Adding Tests") {
                it("adds correct backward horizontal constraints", closure: {
                    let constraints = self.superview.space(subviews: self.subviews, alongAxis: .Horizontal, withPadding: self.kSpaceDefault)
                    expect(constraints.count).to(equal(self.subviews.count-1))

                    var constraint = constraints[0]
                    expect(constraint.firstAttribute).to(equal(NSLayoutAttribute.Left))
                    expect(constraint.secondAttribute).to(equal(NSLayoutAttribute.Right))
                    expect(constraint.constant).to(equal(self.kSpaceDefault))
                    expect(constraint.active).to(equal(true))

                    constraint = constraints[1]
                    expect(constraint.firstAttribute).to(equal(NSLayoutAttribute.Left))
                    expect(constraint.secondAttribute).to(equal(NSLayoutAttribute.Right))
                    expect(constraint.constant).to(equal(self.kSpaceDefault))
                    expect(constraint.active).to(equal(true))

                    constraint = constraints[2]
                    expect(constraint.firstAttribute).to(equal(NSLayoutAttribute.Left))
                    expect(constraint.secondAttribute).to(equal(NSLayoutAttribute.Right))
                    expect(constraint.constant).to(equal(self.kSpaceDefault))
                    expect(constraint.active).to(equal(true))
                })

                it("adds backward vertical constraint", closure: {
                    let constraints = self.superview.space(subviews: self.subviews, alongAxis: .Vertical, withPadding: self.kSpaceDefault)
                    expect(constraints.count).to(equal(self.subviews.count-1))

                    var constraint = constraints[0]
                    expect(constraint.firstAttribute).to(equal(NSLayoutAttribute.Top))
                    expect(constraint.secondAttribute).to(equal(NSLayoutAttribute.Bottom))
                    expect(constraint.constant).to(equal(self.kSpaceDefault))
                    expect(constraint.active).to(equal(true))

                    constraint = constraints[1]
                    expect(constraint.firstAttribute).to(equal(NSLayoutAttribute.Top))
                    expect(constraint.secondAttribute).to(equal(NSLayoutAttribute.Bottom))
                    expect(constraint.constant).to(equal(self.kSpaceDefault))
                    expect(constraint.active).to(equal(true))

                    constraint = constraints[2]
                    expect(constraint.firstAttribute).to(equal(NSLayoutAttribute.Top))
                    expect(constraint.secondAttribute).to(equal(NSLayoutAttribute.Bottom))
                    expect(constraint.constant).to(equal(self.kSpaceDefault))
                    expect(constraint.active).to(equal(true))
                })
            }

            describe("Layout Tests") {
                it("should layout horiontally", closure: {
                    self.subviews[0].pinLeftSpaceToSuperview()

                    for view in self.subviews {
                        view.pinTopSpaceToSuperview()
                    }

                    self.superview.space(subviews: self.subviews,
                        alongAxis: .Horizontal,
                        withPadding: self.kSpaceDefault,
                        positiveDirection: false)

                    self.superview.setNeedsLayout()
                    self.superview.layoutIfNeeded()

                    for var i = 0; i <  self.subviews.count - 1; i++ {
                        let view = self.subviews[i]
                        let view2 = self.subviews[i+1]
                        let xDiff: CGFloat = CGRectGetMinX(view.frame) - CGRectGetMaxX(view2.frame)
                        expect(xDiff).to(equal(self.kSpaceDefault))
                    }
                })

                it("should layout vertically", closure: {
                    self.subviews[0].pinTopSpaceToSuperview()

                    for view in self.subviews {
                        view.pinLeftSpaceToSuperview()
                    }

                    self.superview.space(subviews: self.subviews,
                        alongAxis: .Vertical,
                        withPadding: self.kSpaceDefault,
                        positiveDirection: false)


                    self.superview.setNeedsLayout()
                    self.superview.layoutIfNeeded()

                    for var i = 0; i <  self.subviews.count - 1; i++ {
                        let view = self.subviews[i]
                        let view2 = self.subviews[i+1]
                        let yDiff: CGFloat = CGRectGetMinY(view.frame) - CGRectGetMaxY(view2.frame)
                        expect(yDiff).to(equal(self.kSpaceDefault))
                    }
                })
            }
        }
    }
}
