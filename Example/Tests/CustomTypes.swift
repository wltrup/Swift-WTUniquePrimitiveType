//
//  CustomTypes.swift
//  WTUniquePrimitiveTypes
//
//  Created by Wagner Truppel on 31/05/2017.
//  Copyright © 2017 wtruppel. All rights reserved.
//

import Foundation
import WTUniquePrimitiveType


struct Id<T>: UniqueIntegerType {
    public typealias PrimitiveType = Int
    public let value: Int
    public init(_ value: Int) {
        self.value = value
    }
}


struct Name<T>: UniqueStringType {
    public typealias PrimitiveType = String
    public let value: String
    public init(_ value: String) {
        self.value = value
    }
}


struct Connected<T>: UniqueBooleanType {
    public typealias PrimitiveType = Bool
    public let value: Bool
    public init(_ value: Bool) {
        self.value = value
    }
}


struct CoreTemperature<T>: UniqueFloatingPointType {
    public typealias PrimitiveType = Double
    public let value: Double
    public init(_ value: Double) {
        self.value = value
    }
}


