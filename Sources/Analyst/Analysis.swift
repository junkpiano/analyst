//
//  Analysis.swift
//  Analyst
//
//  Created by Yusuke Ohashi on 2018/08/27.
//  Copyright © 2021 Yusuke Ohashi. All rights reserved.
//

import Foundation

public struct Analysis<T> {
    let aVals: [T]

    public init(with values: [T]) {
        aVals = values
    }

    public func run() -> T {
        let allcase = 100 - (100 % aVals.count)
        let aProb = 100 / aVals.count

        let randomNumber = Int(arc4random_uniform(UInt32(allcase)))
        return aVals[randomNumber / aProb]
    }
}
