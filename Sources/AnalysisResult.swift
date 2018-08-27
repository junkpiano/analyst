//
//  AnalysisResult.swift
//  Analyst
//
//  Created by Yusuke Ohashi on 2018/08/27.
//  Copyright © 2018 Yusuke Ohashi. All rights reserved.
//

import Foundation

public struct AnalysisResult<T> {
    public let value: T?
    public let context: [String: Any]?
    
    init(value: T?, context: [String: Any]?) {
        self.value = value
        self.context = context
    }
}
