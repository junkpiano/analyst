//
//  AnalystTest.swift
//  Analyst
//
//  Created by Yusuke Ohashi on 2018/08/27.
//  Copyright © 2021 Yusuke Ohashi. All rights reserved.
//

import Analyst
import Foundation
import XCTest

final class AnalystTest: XCTestCase {
    func testAnalysisString() {
        let sampleJSON = Bundle.module.url(forResource: "sample", withExtension: "json")
        var analyst = Analyst(source: sampleJSON)

        do {
            let result = try analyst.conduct(by: "test", for: String.self)
            XCTAssertTrue(result.contains("var_"))
        } catch {
            print(error)
            XCTFail("error must not be thrown.")
        }
    }
    
    func testAnalysisNumber() {
        let sampleJSON = Bundle.module.url(forResource: "sample", withExtension: "json")
        var analyst = Analyst(source: sampleJSON)

        do {
            let number = try analyst.conduct(by: "number", for: Int.self)
            XCTAssertEqual(number % 2, 1)
        } catch {
            print(error)
            XCTFail("error must not be thrown.")
        }
    }
}
