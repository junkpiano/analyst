//
//  ViewController.swift
//  Example-iOS
//
//  Created by Yusuke Ohashi on 2018/08/27.
//  Copyright © 2018 Yusuke Ohashi. All rights reserved.
//

import UIKit
import Analyst

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let analyst = Analyst(with: [
            "test": [
                "aProb": 0.25,
                "aValue": "test1",
                "bValue": "test2"
            ],
            "test2": [
                "aProb": 0.5,
                "aValue": 500,
                "bValue": 100
            ]
            ])

        for _ in 1...1000 {
            print(analyst.stringValue(by: "test"))
            print(analyst.integerValue(by: "test2"))
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

