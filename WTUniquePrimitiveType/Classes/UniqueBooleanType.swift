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

// MARK: - Boolean operators

extension UniqueBooleanType where Self.PrimitiveType == Bool {

    public static prefix func !(a: Self) -> Self {
        return self.init(!a.value)
    }

    public static func && (lhs: Self, rhs: @autoclosure () throws -> Self) rethrows -> Self {
        let result = try lhs.value && rhs().value
        return self.init(result)
    }

    public static func && (lhs: Self, rhs: @autoclosure () throws -> Bool) rethrows -> Self {
        let result = try lhs.value && rhs()
        return self.init(result)
    }

    public static func || (lhs: Self, rhs: @autoclosure () throws -> Self) rethrows -> Self {
        let result = try lhs.value || rhs().value
        return self.init(result)
    }

    public static func || (lhs: Self, rhs: @autoclosure () throws -> Bool) rethrows -> Self {
        let result = try lhs.value || rhs()
        return self.init(result)
    }
    
}

extension Bool {

    public static func && <T: UniqueBooleanType>(lhs: Bool, rhs: @autoclosure () throws -> T) rethrows -> T
    where T.PrimitiveType == Bool {
        let result = try lhs && rhs().value
        return T(result)
    }

    public static func || <T: UniqueBooleanType>(lhs: Bool, rhs: @autoclosure () throws -> T) rethrows -> T
        where T.PrimitiveType == Bool {
        let result = try lhs || rhs().value
        return T(result)
    }

}


