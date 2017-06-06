//
//  UniqueUnsignedIntegerType.swift
//  WTUniquePrimitiveTypes
//
//  Created by Wagner Truppel on 31/05/2017.
//  Copyright © 2017 wtruppel. All rights reserved.
//

// swiftlint:disable vertical_whitespace
// swiftlint:disable trailing_newline

import Foundation


public protocol UniqueUnsignedIntegerType: WTUniquePrimitiveType, ExpressibleByIntegerLiteral {

    associatedtype PrimitiveType: UnsignedInteger

}

// MARK: - ExpressibleByIntegerLiteral

extension UniqueUnsignedIntegerType where Self.PrimitiveType: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: Self.PrimitiveType) {
        self.init(value)
    }
}

// MARK: - Convenience

extension UniqueUnsignedIntegerType {

    public var valueAsInt: Int? {
        guard let intValue = Int("\(value)") else { return nil }
        return intValue
    }
    
}

extension UniqueUnsignedIntegerType where Self.PrimitiveType == UInt8 {

    public init?(intValue value: Int) {
        guard let primitiveValue = UInt8.init("\(value)") else { return nil }
        self.init(primitiveValue)
    }
    
}

extension UniqueUnsignedIntegerType where Self.PrimitiveType == UInt16 {

    public init?(intValue value: Int) {
        guard let primitiveValue = UInt16.init("\(value)") else { return nil }
        self.init(primitiveValue)
    }
    
}

extension UniqueUnsignedIntegerType where Self.PrimitiveType == UInt32 {

    public init?(intValue value: Int) {
        guard let primitiveValue = UInt32.init("\(value)") else { return nil }
        self.init(primitiveValue)
    }
    
}

extension UniqueUnsignedIntegerType where Self.PrimitiveType == UInt64 {

    public init?(intValue value: Int) {
        guard let primitiveValue = UInt64.init("\(value)") else { return nil }
        self.init(primitiveValue)
    }
    
}


