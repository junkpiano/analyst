//
//  Analyst.swift
//  Analyst
//
//  Created by Yusuke Ohashi on 2018/08/27.
//  Copyright © 2018 Yusuke Ohashi. All rights reserved.
//

import Foundation

enum AnalysisError: Error {
    case missingField
    case typeMismatch
}

public struct Analyst {
    var info: [String: Any] = [:]
    
    public init(with dictionary: [String: Any]) {
        info = dictionary
    }
        
    public func stringValue(by name: String) -> String {
        do {
            return try value(by: name)
        } catch {
            debugPrint(error)
            return ""
        }
    }
    
    public func integerValue(by name: String) -> Int {
        do {
            return try value(by: name)
        } catch {
            debugPrint(error)
            return 0
        }
    }
    
    public func boolValue(by name: String) -> Bool {
        do {
            return try value(by: name)
        } catch {
            debugPrint(error)
            return false
        }
    }
    
    public func doubleValue(by name: String) -> Double {
        do {
            return try value(by: name)
        } catch {
            debugPrint(error)
            return 0.0
        }
    }
    
    public func floatValue(by name: String) -> Float {
        do {
            return try value(by: name)
        } catch {
            debugPrint(error)
            return 0.0
        }
    }
}

extension Analyst {
    func value<T>(by name: String) throws -> T {
        guard let pattern = info[name] as? [String: Any],
            let aProb = pattern["aProb"] as? Double
            else {
                throw AnalysisError.missingField
        }
        
        if let aValue = pattern["aValue"] as? T,
            let bValue = pattern["bValue"] as? T {
            return Analysis<T>(a: aProb, aValue: aValue, bValue: bValue).perform()
        }
        
        throw AnalysisError.typeMismatch
    }
}
