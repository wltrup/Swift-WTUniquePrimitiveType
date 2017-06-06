//
//  UniqueFloatingPointTypeTests.swift
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


class UniqueFloatingPointTypeTests: XCTestCase {

    func testThatItCreatesTheCorrectInstance() {
        let value: Double = 100
        let floatingQ = FloatingPointQ(value)
        XCTAssertEqual(floatingQ.value, value)
    }

    func testExpressibleByFloatLiteral() {
        let floatingQ = FloatingPointQ(floatLiteral: 100.0)
        XCTAssertEqual(floatingQ.value, 100.0)
    }

    func testExpressibleByIntegerLiteral() {
        let floatingQ = FloatingPointQ(integerLiteral: 100)
        XCTAssertEqual(floatingQ.value, Double(100))
    }

    func testDescription() {
        let value: Double = 100
        let floatingQ = FloatingPointQ(value)
        XCTAssertEqual(floatingQ.description, value.description)
    }

    func testEquatable() {
        let value1: Double = 100
        let value2 = value1
        let floatingQ1 = FloatingPointQ(value1)
        let floatingQ2 = FloatingPointQ(value2)
        XCTAssertTrue(floatingQ1 == floatingQ2)
    }

    func testNotEquatable() {
        let value1: Double = 0
        let value2: Double = 100
        let floatingQ1 = FloatingPointQ(value1)
        let floatingQ2 = FloatingPointQ(value2)
        XCTAssertFalse(floatingQ1 == floatingQ2)
    }

    func testComparable() {
        let value1: Double = 0
        let value2: Double = 100
        let floatingQ1 = FloatingPointQ(value1)
        let floatingQ2 = FloatingPointQ(value2)
        XCTAssertTrue(floatingQ1 < floatingQ2)
    }

    func testNotComparable() {
        let value1: Double = 100
        let value2 = value1
        let floatingQ1 = FloatingPointQ(value1)
        let floatingQ2 = FloatingPointQ(value2)
        XCTAssertFalse(floatingQ1 < floatingQ2)
    }

    func testHashable() {
        let value: Double = 100
        let floatingQ = FloatingPointQ(value)
        XCTAssertEqual(floatingQ.hashValue, value.hashValue)
    }

}


