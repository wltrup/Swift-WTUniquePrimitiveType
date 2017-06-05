//
//  UniqueBooleanType.swift
//  WTUniquePrimitiveTypes
//
//  Created by Wagner Truppel on 31/05/2017.
//  Copyright © 2017 wtruppel. All rights reserved.
//

// swiftlint:disable vertical_whitespace
// swiftlint:disable trailing_newline

import Foundation


public protocol UniqueBooleanType: WTUniquePrimitiveType, ExpressibleByBooleanLiteral {}

extension Bool: Comparable {

    public static func <(lhs: Bool, rhs: Bool) -> Bool {
        return !lhs && rhs
    }

}

// MARK: - ExpressibleByBooleanLiteral

extension UniqueBooleanType where Self.PrimitiveType: ExpressibleByBooleanLiteral {
    public init(booleanLiteral value: Self.PrimitiveType) {
        self.init(value)
    }
}


