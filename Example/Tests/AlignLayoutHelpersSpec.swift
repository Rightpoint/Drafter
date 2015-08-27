//
//  AlignLayoutHelpersSpec.swift
//  Drafter
//
//  Created by Derek Ostrander on 8/25/15.
//  Copyright © 2015 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import Drafter

class AlignLayoutHelpersSpec: QuickSpec {

    let superview = UIView()
    let view = UIView()
    let view2 = UIView()
    let kSpaceDefault: CGFloat = 20.0
    let kSizeDefault: CGSize = CGSizeMake(50, 50)
    let kSuperSizeDefault: CGSize = CGSizeMake(600, 600)
    override func spec() {

        beforeSuite({
            self.superview.frame = CGRectMake(0, 0, self.kSuperSizeDefault.width, self.kSuperSizeDefault.height)
            self.superview.addSubview(self.view)
            self.superview.addSubview(self.view2)
        })

        beforeEach({
            self.superview.translatesAutoresizingMaskIntoConstraints = true
            expect(self.view.constraints).to(equal([]))
            expect(self.view2.constraints).to(equal([]))
            self.view.pinSize(toSize: self.kSizeDefault)
            self.view2.pinSize(toSize: self.kSizeDefault)
        })

        afterEach({
            self.superview.removeConstraints(self.superview.constraints)
            self.view.removeConstraints(self.view.constraints)
            self.view2.removeConstraints(self.view2.constraints)
        })

        describe("AlignLayoutHelpersSpec") {
            context("align left of views") {
                beforeEach({
                    self.view.centerInContainer()
                    self.view2.centerInContainer(forAxis: UILayoutConstraintAxis.Vertical)
                })
                it("adds constraint", closure: {
                    let constraint = self.view2.alignLeft(toLeftOfView: self.view, offset: self.kSpaceDefault)
                    expect(constraint.firstAttribute).to(equal(NSLayoutAttribute.Left))
                    expect(constraint.secondAttribute).to(equal(NSLayoutAttribute.Left))
                    expect(constraint.constant).to(equal(self.kSpaceDefault))
                })

                it("lays out correctly", closure: {
                    self.view2.alignLeft(toLeftOfView: self.view, offset: self.kSpaceDefault)
                    self.superview.setNeedsLayout()
                    self.superview.layoutIfNeeded()
                    expect(CGRectGetMinX(self.view.frame)).to(equal(CGRectGetMinX(self.view2.frame)-self.kSpaceDefault))
                })

            }

            context("align Right of views") {
                beforeEach({
                    self.view.centerInContainer()
                    self.view2.centerInContainer(forAxis: UILayoutConstraintAxis.Vertical)
                })
                it("adds constraint", closure: {
                    let constraint = self.view2.alignRight(toRightOfView: self.view, offset: self.kSpaceDefault)
                    expect(constraint.firstAttribute).to(equal(NSLayoutAttribute.Right))
                    expect(constraint.secondAttribute).to(equal(NSLayoutAttribute.Right))
                    expect(constraint.constant).to(equal(self.kSpaceDefault))
                })

                it("lays out correctly", closure: {
                    self.view2.alignRight(toRightOfView: self.view, offset: self.kSpaceDefault)
                    self.superview.setNeedsLayout()
                    self.superview.layoutIfNeeded()
                    expect(CGRectGetMaxX(self.view.frame)).to(equal(CGRectGetMaxX(self.view2.frame)+self.kSpaceDefault))
                })
                
            }

            context("align Top of views") {
                beforeEach({
                    self.view.centerInContainer()
                    self.view2.centerInContainer(forAxis: UILayoutConstraintAxis.Horizontal)
                })
                it("adds constraint", closure: {
                    let constraint = self.view2.alignTop(toTopOfView: self.view, offset: self.kSpaceDefault)
                    expect(constraint.firstAttribute).to(equal(NSLayoutAttribute.Top))
                    expect(constraint.secondAttribute).to(equal(NSLayoutAttribute.Top))
                    expect(constraint.constant).to(equal(self.kSpaceDefault))
                })

                it("lays out correctly", closure: {
                    self.view2.alignTop(toTopOfView: self.view, offset: self.kSpaceDefault)
                    self.superview.setNeedsLayout()
                    self.superview.layoutIfNeeded()
                    expect(CGRectGetMinY(self.view.frame)).to(equal(CGRectGetMinY(self.view2.frame)-self.kSpaceDefault))
                })
                
            }

            context("align Bottom of views") {
                beforeEach({
                    self.view.centerInContainer()
                    self.view2.centerInContainer(forAxis: UILayoutConstraintAxis.Horizontal)
                })
                it("adds constraint", closure: {
                    let constraint = self.view2.alignBottom(toBottomOfView: self.view, offset: self.kSpaceDefault)
                    expect(constraint.firstAttribute).to(equal(NSLayoutAttribute.Bottom))
                    expect(constraint.secondAttribute).to(equal(NSLayoutAttribute.Bottom))
                    expect(constraint.constant).to(equal(self.kSpaceDefault))
                })

                it("lays out correctly", closure: {
                    self.view2.alignBottom(toBottomOfView: self.view, offset: self.kSpaceDefault)
                    self.superview.setNeedsLayout()
                    self.superview.layoutIfNeeded()
                    expect(CGRectGetMaxY(self.view.frame)).to(equal(CGRectGetMaxY(self.view2.frame)+self.kSpaceDefault))
                })
                
            }
        }
    }
}
