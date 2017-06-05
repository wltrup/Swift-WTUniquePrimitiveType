//
//  UniqueIntegerTypeTests.swift
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

class UniqueIntegerTypeTests: XCTestCase {

    func testThatItCreatesTheCorrectInstance() {
        let value: Int = 100
        let userId = UserId(value)
        XCTAssertEqual(userId.value, value)
    }

    func testExpressibleByIntegerLiteral() {
        let userId = UserId(integerLiteral: 100)
        XCTAssertEqual(userId.value, 100)
    }

    func testDescription() {
        let value: Int = 100
        let userId = UserId(value)
        XCTAssertEqual(userId.description, value.description)
    }

    func testEquatable() {
        let value1: Int = 100
        let userId1 = UserId(value1)
        let value2: Int = 100
        let userId2 = UserId(value2)
        XCTAssertTrue(userId1 == userId2)
    }

    func testNotEquatable() {
        let value1: Int = 0
        let userId1 = UserId(value1)
        let value2: Int = 100
        let userId2 = UserId(value2)
        XCTAssertFalse(userId1 == userId2)
    }

    func testComparable() {
        let value1: Int = 0
        let userId1 = UserId(value1)
        let value2: Int = 100
        let userId2 = UserId(value2)
        XCTAssertTrue(userId1 < userId2)
    }

    func testNotComparable() {
        let value1: Int = 100
        let userId1 = UserId(value1)
        let value2: Int = 100
        let userId2 = UserId(value2)
        XCTAssertFalse(userId1 < userId2)
    }

    func testHashable() {
        let value: Int = 100
        let userId = UserId(value)
        XCTAssertEqual(userId.hashValue, value.hashValue)
    }

}
