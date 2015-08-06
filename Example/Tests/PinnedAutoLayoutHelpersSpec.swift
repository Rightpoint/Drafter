//
//  PinnedAutoLayoutHelpersSpec.swift
//  TailoredSwiftAutoLayoutHelpers
//
//  Created by Matthew Buckley on 8/5/15.
//  Copyright © 2015 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import TailoredSwiftAutoLayoutHelpers

class PinnedAutoLayoutHelpersSpec: QuickSpec {

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

        describe("PinnedAutoLayoutHelpers", {

            context("fillContainer", {

                it("adds requisite constraints", closure: {
                    let insets: UIEdgeInsets = self.kInsetsDefault

                    self.view.fillContainer(insets, priority: UILayoutPriorityDefaultLow)

                    expect(self.superview.constraints.count).to(equal(4))
                    expect(self.superview.constraints.first?.priority).to(equal(UILayoutPriorityDefaultLow))
                    expect(self.view.constraints.count).to(equal(0))
                })
            })

        })
    }
}
