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
        let coreTemp = UserCoreTemperature(value)
        XCTAssertEqual(coreTemp.value, value)
    }

    func testExpressibleByFloatLiteral() {
        let userCoreTemp = UserCoreTemperature(floatLiteral: 100.0)
        XCTAssertEqual(userCoreTemp.value, 100.0)
    }

    func testExpressibleByIntegerLiteral() {
        let userCoreTemp = UserCoreTemperature(integerLiteral: 100)
        XCTAssertEqual(userCoreTemp.value, Double(100))
    }

    func testDescription() {
        let value: Double = 100
        let userCoreTemp = UserCoreTemperature(value)
        XCTAssertEqual(userCoreTemp.description, value.description)
    }

    func testEquatable() {
        let value1: Double = 100
        let coreTemp1 = UserCoreTemperature(value1)
        let value2: Double = 100
        let coreTemp2 = UserCoreTemperature(value2)
        XCTAssertTrue(coreTemp1 == coreTemp2)
    }

    func testNotEquatable() {
        let value1: Double = 0
        let coreTemp1 = UserCoreTemperature(value1)
        let value2: Double = 100
        let coreTemp2 = UserCoreTemperature(value2)
        XCTAssertFalse(coreTemp1 == coreTemp2)
    }

    func testComparable() {
        let value1: Double = 0
        let coreTemp1 = UserCoreTemperature(value1)
        let value2: Double = 100
        let coreTemp2 = UserCoreTemperature(value2)
        XCTAssertTrue(coreTemp1 < coreTemp2)
    }

    func testNotComparable() {
        let value1: Double = 100
        let coreTemp1 = UserCoreTemperature(value1)
        let value2: Double = 100
        let coreTemp2 = UserCoreTemperature(value2)
        XCTAssertFalse(coreTemp1 < coreTemp2)
    }

    func testHashable() {
        let value: Double = 100
        let userCoreTemp = UserCoreTemperature(value)
        XCTAssertEqual(userCoreTemp.hashValue, value.hashValue)
    }

}
