//
//  TypesafeCountTypeTests.swift
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


typealias CountOfItem = TypesafeCountType<UInt32, Item>

class TypesafeCountTypeTests: XCTestCase {

    func testThatItCreatesTheCorrectInstance1() {
        let uint32Count: UInt32 = 100
        let itemCount = CountOfItem(uint32Count)
        XCTAssertEqual(itemCount.value, uint32Count)
        XCTAssertEqual(itemCount.valueAsInt, Int(uint32Count))
    }

}


