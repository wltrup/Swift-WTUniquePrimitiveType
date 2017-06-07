//
//  UniqueIntegerIndexTypeTests.swift
//  WTUniquePrimitiveTypes
//
//  Created by Wagner Truppel on 31/05/2017.
//  Copyright © 2017 wtruppel. All rights reserved.
//

// swiftlint:disable vertical_whitespace
// swiftlint:disable trailing_newline
// swiftlint:disable file_length
// swiftlint:disable type_body_length

import XCTest
import WTUniquePrimitiveType


struct Item {
    // ...
}

typealias IndexOfItem = UniqueIntegerIndexType<UInt8, Item>

class UniqueIntegerIndexTypeTests: XCTestCase {

    func testThatItCreatesTheCorrectInstance1() {
        let uint8Index: UInt8 = 100
        let itemIndex = IndexOfItem(uint8Index)
        XCTAssertEqual(itemIndex.value, uint8Index)
        XCTAssertEqual(itemIndex.valueAsInt, Int(uint8Index))
    }

}


