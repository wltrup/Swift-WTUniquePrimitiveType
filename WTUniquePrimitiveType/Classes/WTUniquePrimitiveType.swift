//
//  WTUniquePrimitiveType.swift
//  WTUniquePrimitiveTypes
//
//  Created by Wagner Truppel on 31/05/2017.
//  Copyright © 2017 wtruppel. All rights reserved.
//

// swiftlint:disable vertical_whitespace
// swiftlint:disable trailing_newline

import Foundation


public protocol WTUniquePrimitiveType: CustomStringConvertible, Equatable, Comparable, Hashable {

    associatedtype PrimitiveType: CustomStringConvertible, Equatable, Comparable, Hashable

    var value: PrimitiveType { get }
    init(_ value: PrimitiveType)

}

// MARK: - CustomStringConvertible

extension WTUniquePrimitiveType {
    public var description: String {
        return "\(value.description)"
    }
}

// MARK: - Equatable

extension WTUniquePrimitiveType {
    public static func == <T: WTUniquePrimitiveType>(lhs: Self, rhs: T) -> Bool
        where T.PrimitiveType == Self.PrimitiveType {
            return lhs.value == rhs.value
    }
}

// MARK: - Comparable

extension WTUniquePrimitiveType {
    public static func < <T: WTUniquePrimitiveType>(lhs: Self, rhs: T) -> Bool
        where T.PrimitiveType == Self.PrimitiveType {
            return lhs.value < rhs.value
    }
}

// MARK: - Hashable

extension WTUniquePrimitiveType {
    public var hashValue: Int {
        return value.hashValue
    }
}


