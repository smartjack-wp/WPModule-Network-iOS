//
//  ViewController.swift
//  WPModuleNetwork
//
//  Created by onemoonStudio on 01/29/2020.
//  Copyright (c) 2020 onemoonStudio. All rights reserved.
//

import UIKit
import WPModuleNetwork

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let cl = TestClass()
        cl.test()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

