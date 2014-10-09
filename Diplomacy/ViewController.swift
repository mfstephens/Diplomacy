//
//  ViewController.swift
//  Diplomacy
//
//  Created by Matthew Stephens on 10/9/14.
//  Copyright (c) 2014 MattStephens. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var testObject = PFObject(className:"TestObject")
        testObject["foo"] = "bar"
        testObject.saveInBackground()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

