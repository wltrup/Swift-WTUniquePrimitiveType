//
//  UniqueStringType.swift
//  WTUniquePrimitiveTypes
//
//  Created by Wagner Truppel on 31/05/2017.
//  Copyright © 2017 wtruppel. All rights reserved.
//

import Foundation


public protocol UniqueStringType: WTUniquePrimitiveType, ExpressibleByStringLiteral,
ExpressibleByExtendedGraphemeClusterLiteral, ExpressibleByUnicodeScalarLiteral {
}

// MARK: - ExpressibleByStringLiteral

extension UniqueStringType where Self.PrimitiveType: ExpressibleByStringLiteral {
    public init(stringLiteral value: Self.PrimitiveType) {
        self.init(value)
    }

}

// MARK: - ExpressibleByExtendedGraphemeClusterLiteral

extension UniqueStringType where Self.PrimitiveType: ExpressibleByExtendedGraphemeClusterLiteral {
    public init(extendedGraphemeClusterLiteral value: Self.PrimitiveType) {
        self.init(value)
    }

}

// MARK: - ExpressibleByUnicodeScalarLiteral

extension UniqueStringType where Self.PrimitiveType: ExpressibleByUnicodeScalarLiteral {
    public init(unicodeScalarLiteral value: Self.PrimitiveType) {
        self.init(value)
    }
}


