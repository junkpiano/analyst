//
//  Analyst.swift
//  Analyst
//
//  Created by Yusuke Ohashi on 2018/08/27.
//  Copyright © 2018 Yusuke Ohashi. All rights reserved.
//

import Foundation

public enum AnalysisError: Error {
    case inValidOrNotFound
    case notTargetted
}

public struct Analyst {
    public static let shared = Analyst()
    let info: [String: Any]
    var isTarget: () -> Bool = { return true }
    
    init(target: (() -> Bool)? = nil) {
        if let path = Bundle.main.path(forResource: "analyst", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let jsonResult = jsonResult as? [String: Any] {
                    info = jsonResult
                } else {
                    info = [:]
                }
            } catch {
                info = [:]
            }
        } else {
            info = [:]
        }
    }
    
    public func conduct<T>(by name: String, context: [String: Any]? = nil) -> AnalysisResult<T> {
        do {
            return AnalysisResult<T>(value: try value(by: name), context: context)
        } catch {
            debugPrint(error)
            return AnalysisResult<T>(value: nil, context: context)
        }
    }
}

extension Analyst {
    func value<T>(by name: String) throws -> T {
        guard let pattern = info[name] as? [T] else {
            throw AnalysisError.inValidOrNotFound
        }
        
        if !isTarget() {
            throw AnalysisError.notTargetted
        }
        
        return Analysis<T>(with: pattern).run()
    }
}
