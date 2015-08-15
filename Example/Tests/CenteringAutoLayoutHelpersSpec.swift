//
//  CenteringAutoLayoutHelpers.swift
//  TailoredSwiftAutoLayoutHelpers
//
//  Created by Matthew Buckley on 8/14/15.
//  Copyright © 2015 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import TailoredSwiftAutoLayoutHelpers

class CenteringAutoLayoutHelpersSpec: QuickSpec {

    let superview = UIView()
    let view: UIView = UIView()

    override func spec() {

        let kPositiveOffsetDefault: CGFloat = 7.0
        let kNegativeOffsetDefault: CGFloat = -7.0
        
        beforeSuite({
            self.superview.addSubview(self.view)
        })
        
        beforeEach {
            expect(self.view.constraints).to(equal([]))
            expect(self.view.superview?.constraints).to(equal([]))
        }

        afterEach({
            expect(self.superview.constraints.count).to(equal(1))
            expect(self.view.constraints.count).to(equal(0))
            self.view.removeConstraints(self.view.constraints)
            self.view.superview?.removeConstraints(self.view.superview?.constraints ?? [])
        })

        describe("CenteringAutoLayoutHelpers", {

            context("centerInContainer horizontally", {

                it("centers view in container horizontally with default priority and default offset", closure: {
                    self.view.centerInContainer(axis: .Horizontal)

                    let centerXConstraint: NSLayoutConstraint? = self.superview.constraints.first

                    self.validateConstraint(centerXConstraint, priority: UILayoutPriorityRequired, constant: 0.0, centeringAttribute: .CenterX)
                })

                it("centers view in container horizontally with low priority and default offset", closure: {
                    self.view.centerInContainer(withOffset: 0.0, axis: .Horizontal, priority: UILayoutPriorityDefaultLow)

                    let centerXConstraint: NSLayoutConstraint? = self.superview.constraints.first

                    self.validateConstraint(centerXConstraint, priority: UILayoutPriorityDefaultLow, constant: 0.0, centeringAttribute: .CenterX)
                })

                it("centers view in container horizontally with positive offset", closure: {
                    self.view.centerInContainer(withOffset: kPositiveOffsetDefault, axis: .Horizontal, priority: UILayoutPriorityRequired)

                    let centerXConstraint: NSLayoutConstraint? = self.superview.constraints.first

                    self.validateConstraint(centerXConstraint, priority: UILayoutPriorityRequired, constant: kPositiveOffsetDefault, centeringAttribute: .CenterX)
                })

                it("centers view in container horizontally with negative offset", closure: {
                    self.view.centerInContainer(withOffset: kNegativeOffsetDefault, axis: .Horizontal, priority: UILayoutPriorityRequired)

                    let centerXConstraint: NSLayoutConstraint? = self.superview.constraints.first

                    self.validateConstraint(centerXConstraint, priority: UILayoutPriorityRequired, constant: kNegativeOffsetDefault, centeringAttribute: .CenterX)
                })

            })

            context("centerInContainer vertically", {

                it("centers view in container vertically with default priority and default offset", closure: {
                    self.view.centerInContainer(axis: .Vertical)

                    let centerYConstraint: NSLayoutConstraint? = self.superview.constraints.first

                    self.validateConstraint(centerYConstraint, priority: UILayoutPriorityRequired, constant: 0.0, centeringAttribute: .CenterY)
                })

                it("centers view in container vertically with low priority and default offset", closure: {
                    self.view.centerInContainer(withOffset: 0.0, axis: .Vertical, priority: UILayoutPriorityDefaultLow)

                    let centerYConstraint: NSLayoutConstraint? = self.superview.constraints.first

                    self.validateConstraint(centerYConstraint, priority: UILayoutPriorityDefaultLow, constant: 0.0, centeringAttribute: .CenterY)
                })

                it("centers view in container vertically with positive offset", closure: {
                    self.view.centerInContainer(withOffset: kPositiveOffsetDefault, axis: .Vertical, priority: UILayoutPriorityRequired)

                    let centerYConstraint: NSLayoutConstraint? = self.superview.constraints.first

                    self.validateConstraint(centerYConstraint, priority:UILayoutPriorityRequired, constant: kPositiveOffsetDefault, centeringAttribute: .CenterY)
                })

                it("centers view in container vertically with negative offset", closure: {
                    self.view.centerInContainer(withOffset: kNegativeOffsetDefault, axis: .Vertical, priority: UILayoutPriorityRequired)

                    let centerYConstraint: NSLayoutConstraint? = self.superview.constraints.first

                    self.validateConstraint(centerYConstraint, priority: UILayoutPriorityRequired, constant: kNegativeOffsetDefault, centeringAttribute: .CenterY)
                })

            })
        })

    }

    // MARK: Private Interface

    private func validateConstraint(constraint: NSLayoutConstraint?, priority: UILayoutPriority, constant: CGFloat, centeringAttribute: NSLayoutAttribute) -> Void {
        expect(constraint?.firstAttribute).to(equal(centeringAttribute))
        expect(constraint?.secondAttribute).to(equal(centeringAttribute))
        expect(constraint?.priority).to(equal(priority))
        expect(constraint?.constant).to(equal(constant))
    }


}
