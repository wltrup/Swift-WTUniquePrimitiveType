//
//  UniqueStringTypeTests.swift
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

class UniqueStringTypeTests: XCTestCase {

    func testThatItCreatesTheCorrectInstance() {
        let value: String = "John Doe"
        let stringQ = StringQ(value)
        XCTAssertEqual(stringQ.value, value)
    }

    func testExpressibleByStringLiteral() {
        let stringQ = StringQ(stringLiteral: "John Doe")
        XCTAssertEqual(stringQ.value, "John Doe")
    }

    func testExpressibleByExtendedGraphemeClusterLiteral() {
        let stringQ = StringQ(extendedGraphemeClusterLiteral: "John Doe")
        XCTAssertEqual(stringQ.value, "John Doe")
    }

    func testExpressibleByUnicodeScalarLiteral() {
        let stringQ = StringQ(unicodeScalarLiteral: "John Doe")
        XCTAssertEqual(stringQ.value, "John Doe")
    }

    func testDescription() {
        let value: String = "John Doe"
        let stringQ = StringQ(value)
        XCTAssertEqual(stringQ.description, value.description)
    }

    func testEquatable() {
        let value1: String = "John Doe"
        let value2 = value1
        let stringQ1 = StringQ(value1)
        let stringQ2 = StringQ(value2)
        XCTAssertTrue(stringQ1 == stringQ2)
    }

    func testNotEquatable() {
        let value1: String = "Jane Doe"
        let value2: String = "John Doe"
        let stringQ1 = StringQ(value1)
        let stringQ2 = StringQ(value2)
        XCTAssertFalse(stringQ1 == stringQ2)
    }

    func testComparable() {
        let value1: String = "Jane Doe"
        let value2: String = "John Doe"
        let stringQ1 = StringQ(value1)
        let stringQ2 = StringQ(value2)
        XCTAssertTrue(stringQ1 < stringQ2)
    }

    func testNotComparable() {
        let value1: String = "John Doe"
        let value2 = value1
        let stringQ1 = StringQ(value1)
        let stringQ2 = StringQ(value2)
        XCTAssertFalse(stringQ1 < stringQ2)
    }

    func testHashable() {
        let value: String = "John Doe"
        let stringQ = StringQ(value)
        XCTAssertEqual(stringQ.hashValue, value.hashValue)
    }

}


