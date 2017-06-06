//
//  UniqueSignedIntegerType.swift
//  WTUniquePrimitiveTypes
//
//  Created by Wagner Truppel on 31/05/2017.
//  Copyright © 2017 wtruppel. All rights reserved.
//

// swiftlint:disable vertical_whitespace
// swiftlint:disable trailing_newline

import Foundation


public protocol UniqueSignedIntegerType: WTUniquePrimitiveType, ExpressibleByIntegerLiteral {

    associatedtype PrimitiveType: SignedInteger

}

// MARK: - ExpressibleByIntegerLiteral

extension UniqueSignedIntegerType where Self.PrimitiveType: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: Self.PrimitiveType) {
        self.init(value)
    }
}

// MARK: - Convenience

extension UniqueSignedIntegerType {

    public var valueAsInt: Int? {
        guard let intValue = Int("\(value)") else { return nil }
        return intValue
    }
    
}

extension UniqueSignedIntegerType where Self.PrimitiveType == Int8 {

    public init?(intValue value: Int) {
        guard let primitiveValue = Int8.init("\(value)") else { return nil }
        self.init(primitiveValue)
    }
    
}

extension UniqueSignedIntegerType where Self.PrimitiveType == Int16 {

    public init?(intValue value: Int) {
        guard let primitiveValue = Int16.init("\(value)") else { return nil }
        self.init(primitiveValue)
    }
    
}

extension UniqueSignedIntegerType where Self.PrimitiveType == Int32 {

    public init?(intValue value: Int) {
        guard let primitiveValue = Int32.init("\(value)") else { return nil }
        self.init(primitiveValue)
    }
    
}

extension UniqueSignedIntegerType where Self.PrimitiveType == Int64 {

    public init?(intValue value: Int) {
        guard let primitiveValue = Int64.init("\(value)") else { return nil }
        self.init(primitiveValue)
    }
    
}


