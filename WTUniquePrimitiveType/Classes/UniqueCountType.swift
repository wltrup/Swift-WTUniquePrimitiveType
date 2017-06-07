//
//  UniqueCountType.swift
//  WTUniquePrimitiveTypes
//
//  Created by Wagner Truppel on 31/05/2017.
//  Copyright © 2017 wtruppel. All rights reserved.
//

// swiftlint:disable vertical_whitespace
// swiftlint:disable trailing_newline

import Foundation


public typealias UniqueIntCountType<TargetType>  = UniqueCountType<Int,  TargetType>
public typealias UniqueUIntCountType<TargetType> = UniqueCountType<UInt, TargetType>

public struct UniqueCountType<CountType: Integer, TargetType>: UniqueIntegerType {
    public typealias PrimitiveType = CountType
    public let value: CountType
    public init(_ value: CountType) {
        self.value = value
    }
}


