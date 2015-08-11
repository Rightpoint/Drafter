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
        v.backgroundColor = UIColor.redColor()
        self.view .addSubview(v)
        v.translatesAutoresizingMaskIntoConstraints = false
        v.fillContainer(UIEdgeInsetsMake(100, 50, 120, 90))
        v.setNeedsLayout()

//        v.pinLeft

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

