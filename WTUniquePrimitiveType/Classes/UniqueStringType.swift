//
//  UniqueStringType.swift
//  WTUniquePrimitiveTypes
//
//  Created by Wagner Truppel on 31/05/2017.
//  Copyright © 2017 wtruppel. All rights reserved.
//

// swiftlint:disable vertical_whitespace
// swiftlint:disable trailing_newline

import Foundation


public protocol UniqueStringType: WTUniquePrimitiveType, ExpressibleByStringLiteral {

    associatedtype PrimitiveType: ExpressibleByStringLiteral
    
}

// MARK: - ExpressibleByStringLiteral

extension UniqueStringType {
    public init(stringLiteral value: Self.PrimitiveType) {
        self.init(value)
    }

}

// MARK: - ExpressibleByExtendedGraphemeClusterLiteral

extension UniqueStringType {
    public init(extendedGraphemeClusterLiteral value: Self.PrimitiveType) {
        self.init(value)
    }

}

// MARK: - ExpressibleByUnicodeScalarLiteral

extension UniqueStringType {
    public init(unicodeScalarLiteral value: Self.PrimitiveType) {
        self.init(value)
    }
}


