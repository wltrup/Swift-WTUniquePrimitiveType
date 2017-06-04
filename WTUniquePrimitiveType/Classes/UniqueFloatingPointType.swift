//
//  UniqueFloatingPointType.swift
//  WTUniquePrimitiveTypes
//
//  Created by Wagner Truppel on 31/05/2017.
//  Copyright © 2017 wtruppel. All rights reserved.
//

import Foundation


public protocol UniqueFloatingPointType: WTUniquePrimitiveType, ExpressibleByFloatLiteral,
ExpressibleByIntegerLiteral {

    associatedtype PrimitiveType: BinaryFloatingPoint

}

// MARK: - ExpressibleByFloatLiteral

extension UniqueFloatingPointType where Self.PrimitiveType: ExpressibleByFloatLiteral {
    public init(floatLiteral value: Self.PrimitiveType) {
        self.init(value)
    }
}

// MARK: - ExpressibleByIntegerLiteral

extension UniqueFloatingPointType where Self.PrimitiveType: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: Self.PrimitiveType) {
        self.init(value)
    }
}


