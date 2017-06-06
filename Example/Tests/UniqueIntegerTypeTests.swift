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
// swiftlint:disable variable_name

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

    struct Quantity<T: _StringInitialisableInteger>: UniqueIntegerType {
        public typealias PrimitiveType = T
        public let value: T
        public init(_ value: T) {
            self.value = value
        }
    }

    func testIntInit() {

        func applyIntInitTest<T: _StringInitialisableInteger>(_ ival: Int, _ tval: T) {
            do {
                let quantity = try Quantity<T>(intValue: ival)
                XCTAssertEqual(quantity.value, tval)
            } catch {
                guard let e = error as? UniquePrimitiveTypeError<Int, T.Type> else {
                    XCTFail()
                    return
                }
                XCTAssertTrue(e.kind == .initialization)
                XCTAssertTrue(e.sourceValue == ival)
            }
        }

        applyIntInitTest(-100, Int8(-100)) // should pass
        applyIntInitTest(-1_000, Int8(-100)) // should throw

        applyIntInitTest(-100, Int16(-100)) // should pass
        applyIntInitTest(-100_000, Int16(-100)) // should throw

        applyIntInitTest(-100, Int32(-100)) // should pass
        applyIntInitTest(-100_000_000_000, Int32(-100)) // should throw

        applyIntInitTest(-100, Int64(-100)) // should pass

        applyIntInitTest(100, UInt8(100)) // should pass
        applyIntInitTest(-100, UInt8(100)) // should throw
        applyIntInitTest(1_000, UInt8(100)) // should throw

        applyIntInitTest(100, UInt16(100)) // should pass
        applyIntInitTest(-100, UInt16(100)) // should throw
        applyIntInitTest(100_000, UInt16(100)) // should throw

        applyIntInitTest(100, UInt32(100)) // should pass
        applyIntInitTest(-100, UInt32(100)) // should throw
        applyIntInitTest(100_000_000_000, UInt32(100)) // should throw

        applyIntInitTest(100, UInt64(100)) // should pass
        applyIntInitTest(-100, UInt64(100)) // should throw

    }

    func testValueAsInt() {

        func applyValueAsIntTest<T: _StringInitialisableInteger>(_ tval: T) {
            do {
                guard let ival = Int("\(tval)") else { XCTFail(); return }
                let quantity = Quantity<T>(tval)
                let intValue = try quantity.valueAsInt()
                XCTAssertEqual(intValue, ival)
            } catch { XCTFail() }
        }

        applyValueAsIntTest(Int8.max)
        applyValueAsIntTest(Int16.max)
        applyValueAsIntTest(Int32.max)
        applyValueAsIntTest(Int64.max)
        applyValueAsIntTest(UInt8.max)
        applyValueAsIntTest(UInt16.max)
        applyValueAsIntTest(UInt32.max)

        do {
            let quantity = Quantity<UInt64>(UInt64.max)
            let _ = try quantity.valueAsInt()
        } catch {
            guard let e = error as? UniquePrimitiveTypeError<UInt64, Int.Type> else {
                XCTFail()
                return
            }
            XCTAssertTrue(e.kind == .conversion)
            XCTAssertTrue(e.sourceValue == UInt64.max)
        }

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
