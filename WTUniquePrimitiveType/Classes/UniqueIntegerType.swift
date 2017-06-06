//
//  UniqueIntegerType.swift
//  WTUniquePrimitiveTypes
//
//  Created by Wagner Truppel on 31/05/2017.
//  Copyright © 2017 wtruppel. All rights reserved.
//

// swiftlint:disable vertical_whitespace
// swiftlint:disable trailing_newline

import Foundation


public protocol UniqueIntegerType: WTUniquePrimitiveType, ExpressibleByIntegerLiteral {

    associatedtype PrimitiveType: Integer

}

// MARK: - ExpressibleByIntegerLiteral

extension UniqueIntegerType where Self.PrimitiveType: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: Self.PrimitiveType) {
        self.init(value)
    }
}

// MARK: - Convenience

extension UniqueIntegerType {

    public func valueAsInt() throws -> Int {
        guard let intValue = Int("\(value)") else {
            throw UniquePrimitiveTypeError(kind: .conversion,
                                           sourceValue: value,
                                           targetType: Int.self)
        }
        return intValue
    }
    
}


public protocol _StringInitialisableInteger: Integer {
    init?(_ text: String, radix: Int)
}
extension Int8: _StringInitialisableInteger {}
extension Int16: _StringInitialisableInteger {}
extension Int32: _StringInitialisableInteger {}
extension Int64: _StringInitialisableInteger {}
extension UInt8: _StringInitialisableInteger {}
extension UInt16: _StringInitialisableInteger {}
extension UInt32: _StringInitialisableInteger {}
extension UInt64: _StringInitialisableInteger {}

extension UniqueIntegerType where Self.PrimitiveType: _StringInitialisableInteger {

    public init(intValue value: Int) throws {
        guard let primitiveValue = Self.PrimitiveType.init("\(value)", radix: 10) else {
            throw UniquePrimitiveTypeError(kind: .initialization,
                                           sourceValue: value,
                                           targetType: Self.PrimitiveType.self)
        }
        self.init(primitiveValue)
    }

}


