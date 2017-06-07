//
//  TypesafeCountType.swift
//  WTUniquePrimitiveTypes
//
//  Created by Wagner Truppel on 31/05/2017.
//  Copyright © 2017 wtruppel. All rights reserved.
//

// swiftlint:disable vertical_whitespace
// swiftlint:disable trailing_newline

import Foundation


public typealias TypesafeIntCount<TargetType>  = TypesafeCountType<Int,  TargetType>
public typealias TypesafeUIntCount<TargetType> = TypesafeCountType<UInt, TargetType>

public struct TypesafeCountType<CountType: Integer, TargetType>: UniqueIntegerType {
    public typealias PrimitiveType = CountType
    public let value: CountType
    public init(_ value: CountType) {
        self.value = value
    }
}


