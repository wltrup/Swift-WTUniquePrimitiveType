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


struct Quantity<T: Integer>: UniqueIntegerType {
    public typealias PrimitiveType = T
    public let value: T
    public init(_ value: T) {
        self.value = value
    }
}


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

    func testIntInit_Int8() {
        let tval = Int8(0)
        for (ival, pass) in [ (Int.min, false), (0, true), (Int.max, false) ] {
            let quantity = Quantity<Int8>(intValue: ival)
            XCTAssertEqual(quantity?.value, (pass ? tval : nil))
        }
    }

    func testIntInit_Int16() {
        let tval = Int16(0)
        for (ival, pass) in [ (Int.min, false), (0, true), (Int.max, false) ] {
            let quantity = Quantity<Int16>(intValue: ival)
            XCTAssertEqual(quantity?.value, (pass ? tval : nil))
        }
    }

    func testIntInit_Int32() {
        let tval = Int32(0)
        for (ival, pass) in [ (Int.min, false), (0, true), (Int.max, false) ] {
            let quantity = Quantity<Int32>(intValue: ival)
            XCTAssertEqual(quantity?.value, (pass ? tval : nil))
        }
    }

    func testIntInit_Int64() {
        for (ival, tval, pass) in [ (Int.min, Int64(Int.min), true), (0, Int64(0), true),
                                    (Int.max, Int64(Int.max), true) ] {
                                        let quantity = Quantity<Int64>(intValue: ival)
                                        XCTAssertEqual(quantity?.value, (pass ? tval : nil))
        }
    }

    func testIntInit_UInt8() {
        let tval = UInt8(0)
        for (ival, pass) in [ (Int.min, false), (0, true), (Int.max, false) ] {
            let quantity = Quantity<UInt8>(intValue: ival)
            XCTAssertEqual(quantity?.value, (pass ? tval : nil))
        }
    }

    func testIntInit_UInt16() {
        let tval = UInt16(0)
        for (ival, pass) in [ (Int.min, false), (0, true), (Int.max, false) ] {
            let quantity = Quantity<UInt16>(intValue: ival)
            XCTAssertEqual(quantity?.value, (pass ? tval : nil))
        }
    }

    func testIntInit_UInt32() {
        let tval = UInt32(0)
        for (ival, pass) in [ (Int.min, false), (0, true), (Int.max, false) ] {
            let quantity = Quantity<UInt32>(intValue: ival)
            XCTAssertEqual(quantity?.value, (pass ? tval : nil))
        }
    }

    func testIntInit_UInt64() {
        for (ival, tval, pass) in [ (Int.min, UInt64(0), false), (0, UInt64(0), true),
                                    (Int.max, UInt64(Int.max), true) ] {
                                        let quantity = Quantity<UInt64>(intValue: ival)
                                        XCTAssertEqual(quantity?.value, (pass ? tval : nil))
        }
    }

    func testValueAsInt() {

        func applyValueAsIntTest<T: Integer>(_ tval: T) {
            guard let ival = Int("\(tval)") else { XCTFail(); return }
            let quantity = Quantity<T>(tval)
            let intValue = quantity.valueAsInt
            XCTAssertEqual(intValue, ival)
        }

        applyValueAsIntTest(Int8.max)
        applyValueAsIntTest(Int16.max)
        applyValueAsIntTest(Int32.max)
        applyValueAsIntTest(Int64.max)
        applyValueAsIntTest(UInt8.max)
        applyValueAsIntTest(UInt16.max)
        applyValueAsIntTest(UInt32.max)

        let quantity = Quantity<UInt64>(UInt64.max)
        let intValue = quantity.valueAsInt
        XCTAssertEqual(intValue, nil)

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
