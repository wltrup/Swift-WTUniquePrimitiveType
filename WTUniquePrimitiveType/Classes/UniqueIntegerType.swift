//
//  UniqueIntegerType.swift
//  WTUniquePrimitiveTypes
//
//  Created by Wagner Truppel on 31/05/2017.
//  Copyright © 2017 wtruppel. All rights reserved.
//

import Foundation


public protocol UniqueIntegerType: WTUniquePrimitiveType, ExpressibleByIntegerLiteral {

    associatedtype PrimitiveType: Integer

}

// MARK: - ExpressibleByIntegerLiteral

extension UniqueIntegerType where Self.PrimitiveType: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: Self.PrimitiveType) {
        self.init(value)
    }
}


