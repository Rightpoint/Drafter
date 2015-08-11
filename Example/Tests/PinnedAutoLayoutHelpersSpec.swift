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
    let kSizeDefault: CGSize = CGSizeMake(100, 200)

    override func spec() {

        beforeSuite({
            self.superview.frame = CGRectMake(0, 0, self.kSizeDefault.width, self.kSizeDefault.height)
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
                    let insets = self.kInsetsDefault
                    let size = self.kSizeDefault


                    print("\(self.superview.frame)")
                    self.view.fillContainer(insets, priority: UILayoutPriorityDefaultLow)

                    expect(self.superview.constraints.count).to(equal(4))
                    expect(self.superview.constraints.first?.priority).to(equal(UILayoutPriorityDefaultLow))
                    expect(self.view.constraints.count).to(equal(0))
                    self.view.setNeedsLayout()
                    self.view.layoutIfNeeded()

                    // make sure the frame is correct
//                    expect(CGRectGetMinX(self.view.frame)).to(equal(insets.left))
//                    expect(CGRectGetMaxX(self.view.frame)).to(equal(size.width - insets.right))
//                    expect(CGRectGetMinY(self.view.frame)).to(equal(insets.top))
//                    expect(CGRectGetMaxY(self.view.frame)).to(equal(size.height - insets.bottom))

                })
            })

        })
    }
}
