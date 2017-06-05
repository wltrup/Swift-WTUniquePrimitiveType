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
        let userName = UserName(value)
        XCTAssertEqual(userName.value, value)
    }

    func testExpressibleByStringLiteral() {
        let userName = UserName(stringLiteral: "John Doe")
        XCTAssertEqual(userName.value, "John Doe")
    }

    func testExpressibleByExtendedGraphemeClusterLiteral() {
        let userName = UserName(extendedGraphemeClusterLiteral: "John Doe")
        XCTAssertEqual(userName.value, "John Doe")
    }

    func testExpressibleByUnicodeScalarLiteral() {
        let userName = UserName(unicodeScalarLiteral: "John Doe")
        XCTAssertEqual(userName.value, "John Doe")
    }

    func testDescription() {
        let value: String = "John Doe"
        let userName = UserName(value)
        XCTAssertEqual(userName.description, value.description)
    }

    func testEquatable() {
        let value1: String = "John Doe"
        let userName1 = UserName(value1)
        let value2: String = "John Doe"
        let userName2 = UserName(value2)
        XCTAssertTrue(userName1 == userName2)
    }

    func testNotEquatable() {
        let value1: String = "Jane Doe"
        let userName1 = UserName(value1)
        let value2: String = "John Doe"
        let userName2 = UserName(value2)
        XCTAssertFalse(userName1 == userName2)
    }

    func testComparable() {
        let value1: String = "Jane Doe"
        let userName1 = UserName(value1)
        let value2: String = "John Doe"
        let userName2 = UserName(value2)
        XCTAssertTrue(userName1 < userName2)
    }

    func testNotComparable() {
        let value1: String = "John Doe"
        let userName1 = UserName(value1)
        let value2: String = "John Doe"
        let userName2 = UserName(value2)
        XCTAssertFalse(userName1 < userName2)
    }

    func testHashable() {
        let value: String = "John Doe"
        let userName = UserName(value)
        XCTAssertEqual(userName.hashValue, value.hashValue)
    }

}
