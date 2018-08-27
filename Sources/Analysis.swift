//
//  Analysis.swift
//  Analyst
//
//  Created by Yusuke Ohashi on 2018/08/27.
//  Copyright © 2018 Yusuke Ohashi. All rights reserved.
//

import Foundation

public struct Analysis<T> {
    let aProb: Double
    let aVal: T
    let bVal: T
    
    public init(a: Double, aValue: T, bValue: T) {
        aProb = a > 1.0 ? 1.0: a
        aVal = aValue
        bVal = bValue
    }
    
    public func perform() -> T {
        let allcase = 1000.0
        let aCase = allcase * aProb
        
        let randomNumber = arc4random_uniform(UInt32(allcase))
        if randomNumber <= Int(aCase) {
            return aVal
        } else {
            return bVal
        }
    }

}
