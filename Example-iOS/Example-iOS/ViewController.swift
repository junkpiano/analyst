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

        print(Analyst.shared.conduct(by: "test1").value ?? "aaa")
        print(Analyst.shared.conduct(by: "test2").value ?? 1000)
        print(Analyst.shared.conduct(by: "subscribeButton").value ?? "push")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension UIColor {
    static func hex(_ hex: NSString, alpha: Float) -> UIColor {
        let hexStr = hex.replacingOccurrences(of: "#", with: "")
        let scanner = Scanner(string: hexStr as String)
        var color: UInt32 = 0
        if scanner.scanHexInt32(&color) {
            let r = CGFloat((color & 0xFF0000) >> 16) / 255.0
            let g = CGFloat((color & 0x00FF00) >> 8) / 255.0
            let b = CGFloat(color & 0x0000FF) / 255.0
            return UIColor(red:r,green:g,blue:b,alpha:CGFloat(alpha))
        } else {
            return UIColor.white;
        }
    }
}
