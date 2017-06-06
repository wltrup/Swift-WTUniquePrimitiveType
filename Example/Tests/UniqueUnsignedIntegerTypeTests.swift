//
//  UniqueUnsignedIntegerTypeTests.swift
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


class UniqueUnsignedIntegerTypeTests: XCTestCase {

    func testThatItCreatesTheCorrectInstance() {
        let value: UInt32 = 100
        let unsignedQ = UnsignedQ(value)
        XCTAssertEqual(unsignedQ.value, value)
    }

    func testExpressibleByIntegerLiteral() {
        let unsignedQ = UnsignedQ(integerLiteral: 100)
        XCTAssertEqual(unsignedQ.value, 100)
    }

    func testIntInit_UInt8() {
        let tval = UInt8(0)
        for (ival, pass) in [ (Int.min, false), (0, true), (Int.max, false) ] {
            let unsignedQ = UnsignedQuantity<UInt8>(intValue: ival)
            XCTAssertEqual(unsignedQ?.value, (pass ? tval : nil))
        }
    }

    func testIntInit_UInt16() {
        let tval = UInt16(0)
        for (ival, pass) in [ (Int.min, false), (0, true), (Int.max, false) ] {
            let unsignedQ = UnsignedQuantity<UInt16>(intValue: ival)
            XCTAssertEqual(unsignedQ?.value, (pass ? tval : nil))
        }
    }

    func testIntInit_UInt32() {
        let tval = UInt32(0)
        for (ival, pass) in [ (Int.min, false), (0, true), (Int.max, false) ] {
            let unsignedQ = UnsignedQuantity<UInt32>(intValue: ival)
            XCTAssertEqual(unsignedQ?.value, (pass ? tval : nil))
        }
    }

    func testIntInit_UInt64() {
        for (ival, tval, pass) in [ (Int.min, UInt64(0), false), (0, UInt64(0), true),
                                    (Int.max, UInt64(Int.max), true) ] {
                                        let unsignedQ = UnsignedQuantity<UInt64>(intValue: ival)
                                        XCTAssertEqual(unsignedQ?.value, (pass ? tval : nil))
        }
    }

    func testValueAsInt() {

        func applyValueAsIntTest<T: UnsignedInteger>(_ tval: T) {
            guard let ival = Int("\(tval)") else { XCTFail(); return }
            let unsignedQ = UnsignedQuantity<T>(tval)
            let intValue = unsignedQ.valueAsInt
            XCTAssertEqual(intValue, ival)
        }

        applyValueAsIntTest(UInt8.max)
        applyValueAsIntTest(UInt16.max)
        applyValueAsIntTest(UInt32.max)

        let unsignedQ = UnsignedQuantity<UInt64>(UInt64.max)
        let intValue = unsignedQ.valueAsInt
        XCTAssertEqual(intValue, nil)

    }

    func testDescription() {
        let value: UInt32 = 100
        let unsignedQ = UnsignedQ(value)
        XCTAssertEqual(unsignedQ.description, value.description)
    }

    func testEquatable() {
        let value1: UInt32 = 100
        let value2 = value1
        let unsignedQ1 = UnsignedQ(value1)
        let unsignedQ2 = UnsignedQ(value2)
        XCTAssertTrue(unsignedQ1 == unsignedQ2)
    }

    func testNotEquatable() {
        let value1: UInt32 = 0
        let value2: UInt32 = 100
        let unsignedQ1 = UnsignedQ(value1)
        let unsignedQ2 = UnsignedQ(value2)
        XCTAssertFalse(unsignedQ1 == unsignedQ2)
    }

    func testComparable() {
        let value1: UInt32 = 0
        let value2: UInt32 = 100
        let unsignedQ1 = UnsignedQ(value1)
        let unsignedQ2 = UnsignedQ(value2)
        XCTAssertTrue(unsignedQ1 < unsignedQ2)
    }

    func testNotComparable() {
        let value1: UInt32 = 100
        let value2: UInt32 = 100
        let unsignedQ1 = UnsignedQ(value1)
        let unsignedQ2 = UnsignedQ(value2)
        XCTAssertFalse(unsignedQ1 < unsignedQ2)
    }

    func testHashable() {
        let value: UInt32 = 100
        let unsignedQ = UnsignedQ(value)
        XCTAssertEqual(unsignedQ.hashValue, value.hashValue)
    }

}
