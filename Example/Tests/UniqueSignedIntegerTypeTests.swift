//
//  UniqueSignedIntegerTypeTests.swift
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


class UniqueSignedIntegerTypeTests: XCTestCase {

    func testThatItCreatesTheCorrectInstance() {
        let value: Int16 = -100
        let signedQ = SignedQ(value)
        XCTAssertEqual(signedQ.value, value)
    }

    func testExpressibleByIntegerLiteral() {
        let signedQ = SignedQ(integerLiteral: -100)
        XCTAssertEqual(signedQ.value, -100)
    }

    func testIntInit_Int8() {
        let tval = Int8(0)
        for (ival, pass) in [ (Int.min, false), (0, true), (Int.max, false) ] {
            let signedQ = SignedQuantity<Int8>(intValue: ival)
            XCTAssertEqual(signedQ?.value, (pass ? tval : nil))
        }
    }

    func testIntInit_Int16() {
        let tval = Int16(0)
        for (ival, pass) in [ (Int.min, false), (0, true), (Int.max, false) ] {
            let signedQ = SignedQuantity<Int16>(intValue: ival)
            XCTAssertEqual(signedQ?.value, (pass ? tval : nil))
        }
    }

    func testIntInit_Int32() {
        let tval = Int32(0)
        for (ival, pass) in [ (Int.min, false), (0, true), (Int.max, false) ] {
            let signedQ = SignedQuantity<Int32>(intValue: ival)
            XCTAssertEqual(signedQ?.value, (pass ? tval : nil))
        }
    }

    func testIntInit_Int64() {
        for (ival, tval, pass) in [ (Int.min, Int64(Int.min), true), (0, Int64(0), true),
                                    (Int.max, Int64(Int.max), true) ] {
                                        let signedQ = SignedQuantity<Int64>(intValue: ival)
                                        XCTAssertEqual(signedQ?.value, (pass ? tval : nil))
        }
    }

    func testValueAsInt() {

        func applyValueAsIntTest<T: SignedInteger>(_ tval: T) {
            guard let ival = Int("\(tval)") else { XCTFail(); return }
            let signedQ = SignedQuantity<T>(tval)
            let intValue = signedQ.valueAsInt
            XCTAssertEqual(intValue, ival)
        }

        applyValueAsIntTest(Int8.max)
        applyValueAsIntTest(Int16.max)
        applyValueAsIntTest(Int32.max)
        applyValueAsIntTest(Int64.max)

    }

    func testDescription() {
        let value: Int16 = -100
        let signedQ = SignedQ(value)
        XCTAssertEqual(signedQ.description, value.description)
    }

    func testEquatable() {
        let value1: Int16 = -100
        let value2 = value1
        let signedQ1 = SignedQ(value1)
        let signedQ2 = SignedQ(value2)
        XCTAssertTrue(signedQ1 == signedQ2)
    }

    func testNotEquatable() {
        let value1: Int16 = 0
        let value2: Int16 = -100
        let signedQ1 = SignedQ(value1)
        let signedQ2 = SignedQ(value2)
        XCTAssertFalse(signedQ1 == signedQ2)
    }

    func testComparable() {
        let value1: Int16 = -100
        let value2: Int16 = 0
        let signedQ1 = SignedQ(value1)
        let signedQ2 = SignedQ(value2)
        XCTAssertTrue(signedQ1 < signedQ2)
    }

    func testNotComparable() {
        let value1: Int16 = -100
        let value2 = value1
        let signedQ1 = SignedQ(value1)
        let signedQ2 = SignedQ(value2)
        XCTAssertFalse(signedQ1 < signedQ2)
    }

    func testHashable() {
        let value: Int16 = -100
        let signedQ = SignedQ(value)
        XCTAssertEqual(signedQ.hashValue, value.hashValue)
    }

}


