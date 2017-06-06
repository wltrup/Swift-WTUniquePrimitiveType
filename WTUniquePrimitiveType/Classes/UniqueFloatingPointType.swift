//
//  UniqueFloatingPointType.swift
//  WTUniquePrimitiveTypes
//
//  Created by Wagner Truppel on 31/05/2017.
//  Copyright © 2017 wtruppel. All rights reserved.
//

// swiftlint:disable vertical_whitespace
// swiftlint:disable trailing_newline

import Foundation


public protocol UniqueFloatingPointType: WTUniquePrimitiveType,
ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral {

    associatedtype PrimitiveType: BinaryFloatingPoint

}

// MARK: - ExpressibleByIntegerLiteral

extension UniqueFloatingPointType {
    public init(integerLiteral value: Self.PrimitiveType) {
        self.init(value)
    }
}

// MARK: - ExpressibleByFloatLiteral

extension UniqueFloatingPointType {
    public init(floatLiteral value: Self.PrimitiveType) {
        self.init(value)
    }
}


