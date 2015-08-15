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

    var v: UIView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(v)
        v.backgroundColor = UIColor.redColor()
        v.fillContainer(UIEdgeInsetsMake(100, 50, 120, 90))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

