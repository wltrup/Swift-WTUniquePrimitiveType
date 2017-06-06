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

extension UniqueIntegerType {
    public init(integerLiteral value: Self.PrimitiveType) {
        self.init(value)
    }
}

// MARK: - Convenience

extension UniqueIntegerType {

    public var valueAsInt: Int? {
        guard let intValue = Int("\(value)") else { return nil }
        return intValue
    }
    
}

extension UniqueIntegerType where Self.PrimitiveType == Int8 {

    public init?(intValue value: Int) {
        guard let primitiveValue = Int8.init("\(value)") else { return nil }
        self.init(primitiveValue)
    }
    
}

extension UniqueIntegerType where Self.PrimitiveType == Int16 {

    public init?(intValue value: Int) {
        guard let primitiveValue = Int16.init("\(value)") else { return nil }
        self.init(primitiveValue)
    }
    
}

extension UniqueIntegerType where Self.PrimitiveType == Int32 {

    public init?(intValue value: Int) {
        guard let primitiveValue = Int32.init("\(value)") else { return nil }
        self.init(primitiveValue)
    }
    
}

extension UniqueIntegerType where Self.PrimitiveType == Int64 {

    public init?(intValue value: Int) {
        // Never fails while Int64 is the largest type available.
        // guard let primitiveValue = Int64.init("\(value)") else { return nil }
        // self.init(primitiveValue)
        self.init(Int64(value))
    }
    
}

extension UniqueIntegerType where Self.PrimitiveType == UInt8 {

    public init?(intValue value: Int) {
        guard let primitiveValue = UInt8.init("\(value)") else { return nil }
        self.init(primitiveValue)
    }
    
}

extension UniqueIntegerType where Self.PrimitiveType == UInt16 {

    public init?(intValue value: Int) {
        guard let primitiveValue = UInt16.init("\(value)") else { return nil }
        self.init(primitiveValue)
    }
    
}

extension UniqueIntegerType where Self.PrimitiveType == UInt32 {

    public init?(intValue value: Int) {
        guard let primitiveValue = UInt32.init("\(value)") else { return nil }
        self.init(primitiveValue)
    }
    
}

extension UniqueIntegerType where Self.PrimitiveType == UInt64 {

    public init?(intValue value: Int) {
        guard let primitiveValue = UInt64.init("\(value)") else { return nil }
        self.init(primitiveValue)
    }
    
}


