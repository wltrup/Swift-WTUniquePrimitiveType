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


typealias BooleanQ = BooleanQuantity
typealias IntegerQ = IntegerQuantity<Int8>
typealias SignedQ = SignedQuantity<Int16>
typealias UnsignedQ = UnsignedQuantity<UInt32>
//typealias FloatingPointQ = FloatingPointQuantity<Double>
typealias StringQ = StringQuantity


struct BooleanQuantity: UniqueBooleanType {
    public typealias PrimitiveType = Bool
    public let value: Bool
    public init(_ value: Bool) {
        self.value = value
    }
}


struct SignedQuantity<T: SignedInteger>: UniqueSignedIntegerType {
    public typealias PrimitiveType = T
    public let value: T
    public init(_ value: T) {
        self.value = value
    }
}


struct UnsignedQuantity<T: UnsignedInteger>: UniqueUnsignedIntegerType {
    public typealias PrimitiveType = T
    public let value: T
    public init(_ value: T) {
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


//struct FloatingPointQuantity<T: BinaryFloatingPoint>: UniqueFloatingPointType {
//    public typealias PrimitiveType = T
//    public let value: T
//    public init(_ value: T) {
//        self.value = value
//    }
//}


struct StringQuantity: UniqueStringType {
    public typealias PrimitiveType = String
    public let value: String
    public init(_ value: String) {
        self.value = value
    }
}


