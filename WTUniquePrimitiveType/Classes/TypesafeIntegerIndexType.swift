//
//  TypesafeIntegerIndexType.swift
//  WTUniquePrimitiveTypes
//
//  Created by Wagner Truppel on 31/05/2017.
//  Copyright © 2017 wtruppel. All rights reserved.
//

// swiftlint:disable vertical_whitespace
// swiftlint:disable trailing_newline

import Foundation


public typealias TypesafeIntIndexType<TargetType>  = TypesafeIntegerIndexType<Int,  TargetType>
public typealias TypesafeUIntIndexType<TargetType> = TypesafeIntegerIndexType<UInt, TargetType>

public struct TypesafeIntegerIndexType<IndexType: Integer, TargetType>: UniqueIntegerType {
    public typealias PrimitiveType = IndexType
    public let value: IndexType
    public init(_ value: IndexType) {
        self.value = value
    }
}


