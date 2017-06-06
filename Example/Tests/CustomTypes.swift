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


struct BooleanQuantity: UniqueBooleanType {
    public typealias PrimitiveType = Bool
    public let value: Bool
    public init(_ value: Bool) {
        self.value = value
    }
}


struct IntegerQuantity: UniqueIntegerType {
    public typealias PrimitiveType = Int8
    public let value: Int8
    public init(_ value: Int8) {
        self.value = value
    }
}


struct SignedQuantity: UniqueSignedIntegerType {
    public typealias PrimitiveType = Int16
    public let value: Int16
    public init(_ value: Int16) {
        self.value = value
    }
}


struct UnsignedQuantity: UniqueUnsignedIntegerType {
    public typealias PrimitiveType = UInt32
    public let value: UInt32
    public init(_ value: UInt32) {
        self.value = value
    }
}


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


