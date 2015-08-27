//
//  AttachmentLayoutHelpersSpec.swift
//  Drafter
//
//  Created by Derek Ostrander on 8/15/15.
//  Copyright © 2015 CocoaPods. All rights reserved.
//


import Quick
import Nimble
import Drafter

class AttachmentLayoutHelpersSpec: QuickSpec {

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
            self.view.translatesAutoresizingMaskIntoConstraints = true
            self.view2.translatesAutoresizingMaskIntoConstraints = true
            self.view.pinSize(toSize: self.kSizeDefault)
            self.view2.pinSize(toSize: self.kSizeDefault)
            expect(self.superview.constraints).to(equal([]))
        })

        afterEach({
            self.superview.removeConstraints(self.superview.constraints)
        })

        describe("Adding Tests") {
            it("adds top correct constraint", closure: {
                let constraint = self.view.attachTop(toBottomOfView: self.view2, withPadding: self.kSpaceDefault)
                expect(constraint.firstAttribute).to(equal(NSLayoutAttribute.Top))
                expect(constraint.secondAttribute).to(equal(NSLayoutAttribute.Bottom))
                expect(constraint.constant).to(equal(self.kSpaceDefault))
                expect(constraint.active).to(equal(true))
                expect(self.view.translatesAutoresizingMaskIntoConstraints).to(equal(false))
                expect(self.view2.translatesAutoresizingMaskIntoConstraints).to(equal(false))
            })

            it("adds left correct constraint", closure: {
                let constraint = self.view.attachLeft(toRightOfView: self.view2, withPadding: self.kSpaceDefault)
                expect(constraint.firstAttribute).to(equal(NSLayoutAttribute.Left))
                expect(constraint.secondAttribute).to(equal(NSLayoutAttribute.Right))
                expect(constraint.constant).to(equal(self.kSpaceDefault))
                expect(constraint.active).to(equal(true))
                expect(self.view.translatesAutoresizingMaskIntoConstraints).to(equal(false))
                expect(self.view2.translatesAutoresizingMaskIntoConstraints).to(equal(false))
            })

            it("adds bottom correct constraint", closure: {
                let constraint = self.view.attachBottom(toTopOfView: self.view2, withPadding: self.kSpaceDefault)
                expect(constraint.firstAttribute).to(equal(NSLayoutAttribute.Top))
                expect(constraint.secondAttribute).to(equal(NSLayoutAttribute.Bottom))
                expect(constraint.constant).to(equal(self.kSpaceDefault))
                expect(constraint.active).to(equal(true))
                expect(self.view.translatesAutoresizingMaskIntoConstraints).to(equal(false))
                expect(self.view2.translatesAutoresizingMaskIntoConstraints).to(equal(false))
            })

            it("adds right correct constraint", closure: {
                let constraint = self.view.attachRight(toLeftOfView: self.view2, withPadding: self.kSpaceDefault)
                expect(constraint.firstAttribute).to(equal(NSLayoutAttribute.Left))
                expect(constraint.secondAttribute).to(equal(NSLayoutAttribute.Right))
                expect(constraint.constant).to(equal(self.kSpaceDefault))
                expect(constraint.active).to(equal(true))
                expect(self.view.translatesAutoresizingMaskIntoConstraints).to(equal(false))
                expect(self.view2.translatesAutoresizingMaskIntoConstraints).to(equal(false))
            })
        }

        describe("Layout Tests") {
            it("Should layout view2's frame to the right and below view1", closure: {
                self.view.pinLeftSpaceToSuperview()
                self.view.pinTopSpaceToSuperview()
                self.view2.attachTop(toBottomOfView: self.view, withPadding: self.kSpaceDefault)
                self.view2.attachLeft(toRightOfView: self.view, withPadding: self.kSpaceDefault)
                self.superview.setNeedsLayout()
                self.superview.layoutIfNeeded()

                let xDiff: CGFloat = CGRectGetMinX(self.view2.frame) - CGRectGetMaxX(self.view.frame)
                let yDiff: CGFloat = CGRectGetMinY(self.view2.frame) - CGRectGetMaxY(self.view.frame)
                expect(xDiff).to(equal(self.kSpaceDefault))
                expect(yDiff).to(equal(self.kSpaceDefault))
            })

            it("Should layout view2's frame to the left and above view1", closure: {
                self.view.pinRightSpaceToSuperview()
                self.view.pinBottomSpaceToSuperview()
                self.view2.attachBottom(toTopOfView: self.view, withPadding: self.kSpaceDefault)
                self.view2.attachRight(toLeftOfView: self.view, withPadding: self.kSpaceDefault)
                self.superview.setNeedsLayout()
                self.superview.layoutIfNeeded()

                let xDiff: CGFloat = CGRectGetMinX(self.view.frame) - CGRectGetMaxX(self.view2.frame)
                let yDiff: CGFloat = CGRectGetMinY(self.view.frame) - CGRectGetMaxY(self.view2.frame)
                expect(xDiff).to(equal(self.kSpaceDefault))
                expect(yDiff).to(equal(self.kSpaceDefault))
            })

        }
    }
}
