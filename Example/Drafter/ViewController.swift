//
//  ViewController.swift
//  Drafter
//
//  Created by mattThousand on 07/31/2015.
//  Copyright (c) 2015 mattThousand. All rights reserved.
//

import UIKit
import Drafter

// MARK: Constants

let kSize: CGSize = CGSize(width: 50.0, height: 50.0)
let kInsets: UIEdgeInsets = UIEdgeInsets(top: 20.0, left: 20.0, bottom: 20.0, right: 20.0)
let kSpace: CGFloat = 8.0
let kOffset: CGFloat = 100.0

class ViewController: UIViewController {

    // MARK: Variables
    // fill (pins)
    let fillView = UIView()

    // center
    let centerView = UIView()

    // attach and align
    let right = UIView()
    let left = UIView()
    let top = UIView()
    let bottom = UIView()

    // space and mass align
    let firstHorizontalSpaceView = UIView()
    let spacingHorizontalSubviews: [UIView]

    let firstVerticalSpaceView = UIView()
    let spacingVerticalSubviews: [UIView]

    // MARK: Lifecycle

    required init?(coder aDecoder: NSCoder) {
        spacingHorizontalSubviews = [firstHorizontalSpaceView, UIView(), UIView(), UIView()]
        spacingVerticalSubviews = [firstVerticalSpaceView, UIView(), UIView(), UIView()]
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        fill()
        center()
        attachAndAlignAroundCenter()
        horizontalSpaceAndMassAlignTop()
        verticalSpaceAndMassAlignRight()
    }

    // MARK: Types of layouts

    func fill()
    {
        view.addSubview(fillView)
        fillView.backgroundColor = UIColor.redColor()
        fillView.fillContainer(kInsets)
    }

    func center()
    {
        fillView.addSubview(centerView)
        centerView.pinSize(toSize: kSize)
        centerView.backgroundColor = UIColor.greenColor()
        centerView.centerInContainer()
    }

    func attachAndAlignAroundCenter()
    {
        fillView.addSubview(bottom)
        bottom.pinSize(toSize: kSize)
        bottom.backgroundColor = UIColor.purpleColor()
        bottom.alignRight(toRightOfView: centerView)
        bottom.attachTop(toBottomOfView: centerView, withPadding: kSpace)

        fillView.addSubview(top)
        top.pinSize(toSize: kSize)
        top.backgroundColor = UIColor.purpleColor()
        top.alignLeft(toLeftOfView: centerView)
        top.attachBottom(toTopOfView: centerView, withPadding: kSpace)

        fillView.addSubview(left)
        left.pinSize(toSize: kSize)
        left.backgroundColor = UIColor.purpleColor()
        left.alignBottom(toBottomOfView: centerView)
        left.attachRight(toLeftOfView: centerView, withPadding: kSpace)

        fillView.addSubview(right)
        right.pinSize(toSize: kSize)
        right.backgroundColor = UIColor.purpleColor()
        right.alignTop(toTopOfView: centerView)
        right.attachLeft(toRightOfView: centerView, withPadding: kSpace)
    }

    func horizontalSpaceAndMassAlignTop()
    {
        for view in spacingHorizontalSubviews {
            view.pinSize(toSize: kSize)
            view.backgroundColor = UIColor.blueColor()
            fillView.addSubview(view)
        }
        firstHorizontalSpaceView.pinTopSpaceToSuperview(withPadding: kSpace)
        firstHorizontalSpaceView.pinLeftSpaceToSuperview(withPadding: kSpace)
        fillView.space(subviews: spacingHorizontalSubviews,
            alongAxis: UILayoutConstraintAxis.Horizontal,
            withPadding: kSpace)
        fillView.align(subviews: spacingHorizontalSubviews,
            attribute: .Top)
    }

    func verticalSpaceAndMassAlignRight()
    {
        for view in spacingVerticalSubviews {
            view.pinSize(toSize: kSize)
            view.backgroundColor = UIColor.blueColor()
            fillView.addSubview(view)
        }
        firstVerticalSpaceView.pinBottomSpaceToSuperview(withPadding: kSpace)
        firstVerticalSpaceView.pinRightSpaceToSuperview(withPadding: kSpace)
        fillView.space(subviews: spacingVerticalSubviews,
            alongAxis: UILayoutConstraintAxis.Vertical,
            withPadding: kSpace,
            positiveDirection: false)
        fillView.align(subviews: spacingVerticalSubviews,
            attribute: .Right)
    }
}
