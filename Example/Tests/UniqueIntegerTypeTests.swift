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
        let integerQ = IntegerQuantity(value)
        XCTAssertEqual(integerQ.value, value)
    }

    func testExpressibleByIntegerLiteral() {
        let integerQ = IntegerQuantity(integerLiteral: 100)
        XCTAssertEqual(integerQ.value, 100)
    }

    func testIntInit_Int8() {
        let tval = Int8(0)
        for (ival, pass) in [ (Int.min, false), (0, true), (Int.max, false) ] {
            let integerQ = IntegerQuantity<Int8>(intValue: ival)
            XCTAssertEqual(integerQ?.value, (pass ? tval : nil))
        }
    }

    func testIntInit_Int16() {
        let tval = Int16(0)
        for (ival, pass) in [ (Int.min, false), (0, true), (Int.max, false) ] {
            let integerQ = IntegerQuantity<Int16>(intValue: ival)
            XCTAssertEqual(integerQ?.value, (pass ? tval : nil))
        }
    }

    func testIntInit_Int32() {
        let tval = Int32(0)
        for (ival, pass) in [ (Int.min, false), (0, true), (Int.max, false) ] {
            let integerQ = IntegerQuantity<Int32>(intValue: ival)
            XCTAssertEqual(integerQ?.value, (pass ? tval : nil))
        }
    }

    func testIntInit_Int64() {
        for (ival, tval, pass) in [ (Int.min, Int64(Int.min), true), (0, Int64(0), true),
                                    (Int.max, Int64(Int.max), true) ] {
                                        let integerQ = IntegerQuantity<Int64>(intValue: ival)
                                        XCTAssertEqual(integerQ?.value, (pass ? tval : nil))
        }
    }

    func testIntInit_UInt8() {
        let tval = UInt8(0)
        for (ival, pass) in [ (Int.min, false), (0, true), (Int.max, false) ] {
            let integerQ = IntegerQuantity<UInt8>(intValue: ival)
            XCTAssertEqual(integerQ?.value, (pass ? tval : nil))
        }
    }

    func testIntInit_UInt16() {
        let tval = UInt16(0)
        for (ival, pass) in [ (Int.min, false), (0, true), (Int.max, false) ] {
            let integerQ = IntegerQuantity<UInt16>(intValue: ival)
            XCTAssertEqual(integerQ?.value, (pass ? tval : nil))
        }
    }

    func testIntInit_UInt32() {
        let tval = UInt32(0)
        for (ival, pass) in [ (Int.min, false), (0, true), (Int.max, false) ] {
            let integerQ = IntegerQuantity<UInt32>(intValue: ival)
            XCTAssertEqual(integerQ?.value, (pass ? tval : nil))
        }
    }

    func testIntInit_UInt64() {
        for (ival, tval, pass) in [ (Int.min, UInt64(0), false), (0, UInt64(0), true),
                                    (Int.max, UInt64(Int.max), true) ] {
                                        let integerQ = IntegerQuantity<UInt64>(intValue: ival)
                                        XCTAssertEqual(integerQ?.value, (pass ? tval : nil))
        }
    }

    func testValueAsInt() {

        func applyValueAsIntTest<T: Integer>(_ tval: T) {
            guard let ival = Int("\(tval)") else { XCTFail(); return }
            let integerQ = IntegerQuantity<T>(tval)
            let intValue = integerQ.valueAsInt
            XCTAssertEqual(intValue, ival)
        }

        applyValueAsIntTest(Int8.max)
        applyValueAsIntTest(Int16.max)
        applyValueAsIntTest(Int32.max)
        applyValueAsIntTest(Int64.max)
        applyValueAsIntTest(UInt8.max)
        applyValueAsIntTest(UInt16.max)
        applyValueAsIntTest(UInt32.max)

        let integerQ = IntegerQuantity<UInt64>(UInt64.max)
        let intValue = integerQ.valueAsInt
        XCTAssertEqual(intValue, nil)

    }

    func testDescription() {
        let value: Int = 100
        let integerQ = IntegerQuantity(value)
        XCTAssertEqual(integerQ.description, value.description)
    }

    func testEquatable() {
        let value1: Int = 100
        let value2 = value1
        let integerQ1 = IntegerQuantity(value1)
        let integerQ2 = IntegerQuantity(value2)
        XCTAssertTrue(integerQ1 == integerQ2)
    }

    func testNotEquatable() {
        let value1: Int = 0
        let value2: Int = 100
        let integerQ1 = IntegerQuantity(value1)
        let integerQ2 = IntegerQuantity(value2)
        XCTAssertFalse(integerQ1 == integerQ2)
    }

    func testComparable() {
        let value1: Int = 0
        let value2: Int = 100
        let integerQ1 = IntegerQuantity(value1)
        let integerQ2 = IntegerQuantity(value2)
        XCTAssertTrue(integerQ1 < integerQ2)
    }

    func testNotComparable() {
        let value1: Int = 100
        let value2: Int = 100
        let integerQ1 = IntegerQuantity(value1)
        let integerQ2 = IntegerQuantity(value2)
        XCTAssertFalse(integerQ1 < integerQ2)
    }

    func testHashable() {
        let value: Int = 100
        let integerQ = IntegerQuantity(value)
        XCTAssertEqual(integerQ.hashValue, value.hashValue)
    }

}
