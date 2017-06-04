//
//  UniqueBooleanType.swift
//  WTUniquePrimitiveTypes
//
//  Created by Wagner Truppel on 31/05/2017.
//  Copyright © 2017 wtruppel. All rights reserved.
//

import Foundation


public protocol UniqueBooleanType: WTUniquePrimitiveType {}

extension Bool: Comparable {

    public static func <(lhs: Bool, rhs: Bool) -> Bool {
        return !lhs && rhs
    }

}
