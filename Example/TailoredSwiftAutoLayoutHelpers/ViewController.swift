//
//  ViewController.swift
//  TailoredSwiftAutoLayoutHelpers
//
//  Created by mattThousand on 07/31/2015.
//  Copyright (c) 2015 mattThousand. All rights reserved.
//

import UIKit
import TailoredSwiftAutoLayoutHelpers

class ViewController: UIViewController {

    let kSize: CGSize = CGSize(width: 20, height: 20)
    let v = UIView()
    let v2 = UIView()
    let firstView = UIView()
    let lastView = UIView()
    let kSpace: CGFloat = 5.0
    var spacingSubviews: [UIView]

    required init?(coder aDecoder: NSCoder) {
        spacingSubviews = [firstView, UIView(), UIView(), lastView]
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // pinned
        view.addSubview(v)
        v.backgroundColor = UIColor.redColor()
        v.fillContainer(UIEdgeInsetsMake(20, 20, 20, 20))

        view.addSubview(v2)
        v2.backgroundColor = UIColor.yellowColor()
        v2.pinSize(toSize: kSize)
        v2.attachLeft(toRightOfView: v, withPadding: kSpace)
        v2.pinTopSpaceToSuperview() 
//        v2.attachTop(toBottomOfView: v, withPadding: kSpace)
//        v2.pinLeftSpaceToSuperview()

        // space
        for view in spacingSubviews {
            view.pinSize(toSize: kSize)
            view.backgroundColor = UIColor.blueColor()
            v.addSubview(view)
            view.pinTopSpaceToSuperview(withPadding: kSpace)
        }

        firstView.pinLeftSpaceToSuperview()
        v.space(subviews: spacingSubviews,
            alongAxis: UILayoutConstraintAxis.Horizontal,
            withPadding: kSpace)


    }
}

