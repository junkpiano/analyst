//
//  Analyst.swift
//  Analyst
//
//  Created by Yusuke Ohashi on 2018/08/27.
//  Copyright © 2021 Yusuke Ohashi. All rights reserved.
//

import Foundation

public enum AnalystError: Error {
    case inValidOrNotFound
    case notTargetted
    case sourceNotFound
    case invalidSourceFormat
}

public struct Analyst {
    public static var shared: Analyst {
        return Analyst()
    }

    var info = [String: Any]()
    private let sourcePath: URL?
    var isTarget: () -> Bool = { true }

    public init(target: (() -> Bool)? = nil, source: URL? = nil) {
        sourcePath = source ?? Bundle.main.url(forResource: "analyst", withExtension: "json")
        isTarget = target ?? { true }
    }
    
    public mutating func conduct<T>(by name: String, for: T.Type) throws -> T {
        guard let path = sourcePath else {
            throw AnalystError.sourceNotFound
        }

        do {
            let data = try Data(contentsOf: path, options: .mappedIfSafe)
            let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
            if let jsonResult = jsonResult as? [String: Any] {
                info = jsonResult
            } else {
                throw AnalystError.invalidSourceFormat
            }
            return try value(by: name) as T
        } catch {
            throw error
        }
    }
}

extension Analyst {
    func value<T>(by name: String) throws -> T {
        guard let pattern = info[name] as? [T] else {
            throw AnalystError.inValidOrNotFound
        }

        if !isTarget() {
            throw AnalystError.notTargetted
        }

        return Analysis<T>(with: pattern).run()
    }
}
