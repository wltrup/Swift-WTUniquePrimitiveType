//
//  CustomTypes.swift
//  WTUniquePrimitiveTypes
//
//  Created by Wagner Truppel on 31/05/2017.
//  Copyright © 2017 wtruppel. All rights reserved.
//

// swiftlint:disable vertical_whitespace
// swiftlint:disable trailing_newline
// swiftlint:disable file_length
// swiftlint:disable type_body_length

// swiftlint:disable type_name

import Foundation
import WTUniquePrimitiveType


struct Item {
    // ...
}


typealias BooleanQ = BooleanQuantity
typealias IntegerQ = IntegerQuantity<Int>
// swiftlint:disable todo
// typealias FloatingPointQ = FloatingPointQuantity<Double> // see TODO below
// swiftlint:enable todo
typealias FloatingPointQ = FloatingPointQuantity
typealias StringQ = StringQuantity


struct BooleanQuantity: UniqueBooleanType {
    public typealias PrimitiveType = Bool
    public let value: Bool
    public init(_ value: Bool) {
        self.value = value
    }
}


struct IntegerQuantity<T: Integer>: UniqueIntegerType {
    public typealias PrimitiveType = T
    public let value: T
    public init(_ value: T) {
        self.value = value
    }
}


// swiftlint:disable todo
// TODO: Look into why this does not work. The compiler complains that
// FloatingPointQuantity<T> conforms to neither ExpressibleByIntegerLiteral
// nor ExpressibleByFloatLiteral because the inferred type T does not conform to
// _ExpressibleByBuiltInIntegerLiteral and _ExpressibleByBuiltInFloatLiteral.
//
// But FloatingPointQuantity<T> does conform to both ExpressibleByIntegerLiteral
// and ExpressibleByFloatLiteral since T declared below conforms to BinaryFloatingPoint
// which, itself, conforms to both ExpressibleByIntegerLiteral and ExpressibleByFloatLiteral.
//
// That, in turn, by the protocol extensions declared in UniqueFloatingPointType, does
// imply that FloatingPointQuantity<T>, as declared below, conforms to both
// ExpressibleByIntegerLiteral and ExpressibleByFloatLiteral.
//
//struct FloatingPointQuantity<T: BinaryFloatingPoint & Hashable
//    & CustomStringConvertible>: UniqueFloatingPointType {
//    public typealias PrimitiveType = T
//    public let value: T
//    public init(_ value: T) {
//        self.value = value
//    }
//}
//
// For now, for testing, it suffices to make PrimitiveType explicit. I'll choose Double.
//
// swiftlint:enable todo
struct FloatingPointQuantity: UniqueFloatingPointType {
    public typealias PrimitiveType = Double
    public let value: Double
    public init(_ value: Double) {
        self.value = value
    }
}


struct StringQuantity: UniqueStringType {
    public typealias PrimitiveType = String
    public let value: String
    public init(_ value: String) {
        self.value = value
    }
}


