//
//  UniqueBooleanTypeTests.swift
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

class UniqueBooleanTypeTests: XCTestCase {

    func testThatItCreatesTheCorrectInstance() {
        let value: Bool = true
        let isConnected = UserConnected(value)
        XCTAssertEqual(isConnected.value, value)
    }

    func testExpressibleByBooleanLiteral() {
        let isConnected = UserConnected(booleanLiteral: true)
        XCTAssertEqual(isConnected.value, true)
    }

    func testOperatorBooleanNegation() {
        for b in [false, true] {
            let isConnected = UserConnected(booleanLiteral: b)
            let result = !isConnected
            XCTAssertEqual(result.value, !b)
        }
    }

    func testOperatorBooleanAnd1() {
        for b1 in [false, true] {
            for b2 in [false, true] {
                let isConnected1 = UserConnected(booleanLiteral: b1)
                let isConnected2 = UserConnected(booleanLiteral: b2)
                let result = isConnected1 && isConnected2
                XCTAssertEqual(result.value, b1 && b2)
            }
        }
    }

    func testOperatorBooleanAnd2() {
        for b1 in [false, true] {
            for b2 in [false, true] {
                let isConnected = UserConnected(booleanLiteral: b1)
                let result = isConnected && b2
                XCTAssertEqual(result.value, b1 && b2)
            }
        }
    }

    func testOperatorBooleanAnd3() {
        for b1 in [false, true] {
            for b2 in [false, true] {
                let isConnected = UserConnected(booleanLiteral: b2)
                let result = b1 && isConnected
                XCTAssertEqual(result.value, b1 && b2)
            }
        }
    }

    func testOperatorBooleanOr1() {
        for b1 in [false, true] {
            for b2 in [false, true] {
                let isConnected1 = UserConnected(booleanLiteral: b1)
                let isConnected2 = UserConnected(booleanLiteral: b2)
                let result = isConnected1 || isConnected2
                XCTAssertEqual(result.value, b1 || b2)
            }
        }
    }

    func testOperatorBooleanOr2() {
        for b1 in [false, true] {
            for b2 in [false, true] {
                let isConnected = UserConnected(booleanLiteral: b1)
                let result = isConnected || b2
                XCTAssertEqual(result.value, b1 || b2)
            }
        }
    }

    func testOperatorBooleanOr3() {
        for b1 in [false, true] {
            for b2 in [false, true] {
                let isConnected = UserConnected(booleanLiteral: b2)
                let result = b1 || isConnected
                XCTAssertEqual(result.value, b1 || b2)
            }
        }
    }

    func testDescription() {
        let value: Bool = true
        let isConnected = UserConnected(value)
        XCTAssertEqual(isConnected.description, value.description)
    }

    func testEquatable() {
        let value1: Bool = true
        let isConnected1 = UserConnected(value1)
        let value2: Bool = true
        let isConnected2 = UserConnected(value2)
        XCTAssertTrue(isConnected1 == isConnected2)
    }

    func testNotEquatable() {
        let value1: Bool = false
        let isConnected1 = UserConnected(value1)
        let value2: Bool = true
        let isConnected2 = UserConnected(value2)
        XCTAssertFalse(isConnected1 == isConnected2)
    }

    func testComparable() {
        let value1: Bool = false
        let isConnected1 = UserConnected(value1)
        let value2: Bool = true
        let isConnected2 = UserConnected(value2)
        XCTAssertTrue(isConnected1 < isConnected2)
    }

    func testNotComparable() {
        let value1: Bool = true
        let isConnected1 = UserConnected(value1)
        let value2: Bool = true
        let isConnected2 = UserConnected(value2)
        XCTAssertFalse(isConnected1 < isConnected2)
    }

    func testHashable() {
        let value: Bool = true
        let isConnected = UserConnected(value)
        XCTAssertEqual(isConnected.hashValue, value.hashValue)
    }

}
