//
//  CenteringAutoLayoutHelpers.swift
//  Drafter
//
//  Created by Matthew Buckley on 8/14/15.
//  Copyright © 2015 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import Drafter

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

            context("centerInContainer along horizontal axis", {

                it("centers view in container horizontally with default priority and default offset", closure: {
                    self.view.centerInContainer(forAxis: .Horizontal)

                    let centerXConstraint: NSLayoutConstraint? = self.superview.constraints.first

                    expect(centerXConstraint?.firstAttribute).to(equal(NSLayoutAttribute.CenterX))
                    expect(centerXConstraint?.secondAttribute).to(equal(NSLayoutAttribute.CenterX))
                    expect(centerXConstraint?.priority).to(equal(UILayoutPriorityRequired))
                    expect(centerXConstraint?.constant).to(equal(0.0))
                })

                it("centers view in container horizontally with low priority and default offset", closure: {
                    self.view.centerInContainer(forAxis: .Horizontal, offset: 0.0, priority: UILayoutPriorityDefaultLow)

                    let centerXConstraint: NSLayoutConstraint? = self.superview.constraints.first

                    expect(centerXConstraint?.firstAttribute).to(equal(NSLayoutAttribute.CenterX))
                    expect(centerXConstraint?.secondAttribute).to(equal(NSLayoutAttribute.CenterX))
                    expect(centerXConstraint?.priority).to(equal(UILayoutPriorityDefaultLow))
                    expect(centerXConstraint?.constant).to(equal(0.0))
                })

                it("centers view in container horizontally with positive offset", closure: {
                    self.view.centerInContainer(forAxis: .Horizontal, offset: kPositiveOffsetDefault, priority: UILayoutPriorityRequired)

                    let centerXConstraint: NSLayoutConstraint? = self.superview.constraints.first

                    expect(centerXConstraint?.firstAttribute).to(equal(NSLayoutAttribute.CenterX))
                    expect(centerXConstraint?.secondAttribute).to(equal(NSLayoutAttribute.CenterX))
                    expect(centerXConstraint?.priority).to(equal(UILayoutPriorityRequired))
                    expect(centerXConstraint?.constant).to(equal(kPositiveOffsetDefault))
                })

                it("centers view in container horizontally with negative offset", closure: {
                    self.view.centerInContainer(forAxis: .Horizontal, offset:kNegativeOffsetDefault, priority: UILayoutPriorityRequired)

                    let centerXConstraint: NSLayoutConstraint? = self.superview.constraints.first

                    expect(centerXConstraint?.firstAttribute).to(equal(NSLayoutAttribute.CenterX))
                    expect(centerXConstraint?.secondAttribute).to(equal(NSLayoutAttribute.CenterX))
                    expect(centerXConstraint?.priority).to(equal(UILayoutPriorityRequired))
                    expect(centerXConstraint?.constant).to(equal(kNegativeOffsetDefault))
                })

            })

            context("centerInContainer along vertical axis", {

                it("centers view in container vertically with default priority and default offset", closure: {
                    self.view.centerInContainer(forAxis: .Vertical)

                    let centerYConstraint: NSLayoutConstraint? = self.superview.constraints.first

                    expect(centerYConstraint?.firstAttribute).to(equal(NSLayoutAttribute.CenterY))
                    expect(centerYConstraint?.secondAttribute).to(equal(NSLayoutAttribute.CenterY))
                    expect(centerYConstraint?.priority).to(equal(UILayoutPriorityRequired))
                    expect(centerYConstraint?.constant).to(equal(0.0))
                })

                it("centers view in container vertically with low priority and default offset", closure: {
                    self.view.centerInContainer(forAxis: .Vertical, offset: 0.0, priority: UILayoutPriorityDefaultLow)

                    let centerYConstraint: NSLayoutConstraint? = self.superview.constraints.first

                    expect(centerYConstraint?.firstAttribute).to(equal(NSLayoutAttribute.CenterY))
                    expect(centerYConstraint?.secondAttribute).to(equal(NSLayoutAttribute.CenterY))
                    expect(centerYConstraint?.priority).to(equal(UILayoutPriorityDefaultLow))
                    expect(centerYConstraint?.constant).to(equal(0.0))
                })

                it("centers view in container vertically with positive offset", closure: {
                    self.view.centerInContainer(forAxis: .Vertical, offset: kPositiveOffsetDefault, priority: UILayoutPriorityRequired)

                    let centerYConstraint: NSLayoutConstraint? = self.superview.constraints.first

                    expect(centerYConstraint?.firstAttribute).to(equal(NSLayoutAttribute.CenterY))
                    expect(centerYConstraint?.secondAttribute).to(equal(NSLayoutAttribute.CenterY))
                    expect(centerYConstraint?.priority).to(equal(UILayoutPriorityRequired))
                    expect(centerYConstraint?.constant).to(equal(kPositiveOffsetDefault))
                })

                it("centers view in container vertically with negative offset", closure: {
                    self.view.centerInContainer(forAxis: .Vertical, offset: kNegativeOffsetDefault, priority: UILayoutPriorityRequired)

                    let centerYConstraint: NSLayoutConstraint? = self.superview.constraints.first

                    expect(centerYConstraint?.firstAttribute).to(equal(NSLayoutAttribute.CenterY))
                    expect(centerYConstraint?.secondAttribute).to(equal(NSLayoutAttribute.CenterY))
                    expect(centerYConstraint?.priority).to(equal(UILayoutPriorityRequired))
                    expect(centerYConstraint?.constant).to(equal(kNegativeOffsetDefault))
                })

            })
        })

    }

}
