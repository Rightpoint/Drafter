//
//  ViewController.swift
//  Drafter
//
//  Created by mattThousand on 07/31/2015.
//  Copyright (c) 2015 mattThousand. All rights reserved.
//

import UIKit
import Drafter

class ViewController: UIViewController {

    var v: UIView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(v)
        v.backgroundColor = UIColor.redColor()
        v.fillContainer(UIEdgeInsetsMake(100, 50, 120, 90))
    }
}

