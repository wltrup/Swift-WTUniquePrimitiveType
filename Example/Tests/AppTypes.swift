//
//  AppTypes.swift
//  WTUniquePrimitiveTypes
//
//  Created by Wagner Truppel on 31/05/2017.
//  Copyright © 2017 wtruppel. All rights reserved.
//

// swiftlint:disable vertical_whitespace
// swiftlint:disable trailing_newline
// swiftlint:disable file_length
// swiftlint:disable type_body_length

// swiftlint:disable variable_name

import Foundation
import WTUniquePrimitiveType


typealias BooleanQ = BooleanQuantity
typealias IntegerQ = IntegerQuantity
typealias SignedQ = SignedQuantity
typealias UnsignedQ = UnsignedQuantity
typealias FloatingPointQ = FloatingPointQuantity
typealias StringQ = StringQuantity

struct SomeType {
    let booleanQ: BooleanQ              // backed by a Bool
    let integerQ: IntegerQ              // backed by an Integer type, signed or unsigned
    let signedQ: SignedQ                // backed by a signed Integer type
    let unsignedQ: UnsignedQ            // backed by an unsigned Integer type
    let floatingPointQ: FloatingPointQ  // backed by any floating type
    let stringQ: StringQ                // backed by a String
}


