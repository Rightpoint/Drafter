//
//  CreatorAutolayoutHelperSpec.swift
//  Drafter
//
//  Created by Derek Ostrander on 8/8/15.
//  Copyright © 2015 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import Drafter

class CreatorAutolayoutHelpersSpec: QuickSpec {

    let superview: UIView = UIView()
    let view: UIView = UIView()
    let kInsetsDefault: UIEdgeInsets = UIEdgeInsetsMake(1.0, 2.0, 3.0, 4.0)

    override func spec() {

        beforeSuite({
            self.superview.addSubview(self.view)
        })

        beforeEach({
            expect(self.superview.constraints).to(equal([]))
        })

        afterEach({
            self.superview.removeConstraints(self.view.constraints)
        })

        describe("CreatorAutoLayoutHelpers", {

            context("pinSideInactive", {

                it("doesn't set the left constraint to active", closure: {
                    let constraint = self.view.pinLeftSpaceToSuperview(isActive: false)
                    expect(self.view.translatesAutoresizingMaskIntoConstraints).to(equal(false))
                    expect(constraint.active).to(equal(false))
                    expect(self.superview.constraints.count).to(equal(0))
                })
                it("doesn't set the right constraint to active", closure: {
                    let constraint = self.view.pinRightSpaceToSuperview(isActive: false)
                    expect(self.view.translatesAutoresizingMaskIntoConstraints).to(equal(false))
                    expect(constraint.active).to(equal(false))
                    expect(self.superview.constraints.count).to(equal(0))
                })
                it("doesn't set the bottom constraint to active", closure: {
                    let constraint = self.view.pinBottomSpaceToSuperview(isActive: false)
                    expect(self.view.translatesAutoresizingMaskIntoConstraints).to(equal(false))
                    expect(constraint.active).to(equal(false))
                    expect(self.superview.constraints.count).to(equal(0))
                })
                it("doesn't set the top constraint to active", closure: {
                    let constraint = self.view.pinTopSpaceToSuperview(isActive: false)
                    expect(self.view.translatesAutoresizingMaskIntoConstraints).to(equal(false))
                    expect(constraint.active).to(equal(false))
                    expect(self.superview.constraints.count).to(equal(0))
                })

            })
        })
    }
}
