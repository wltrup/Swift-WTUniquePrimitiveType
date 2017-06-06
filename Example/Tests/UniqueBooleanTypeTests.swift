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
        for b in [false, true] {
            let booleanQ = BooleanQ(b)
            XCTAssertEqual(booleanQ.value, b)
        }
    }

    func testExpressibleByBooleanLiteral() {
        for b in [false, true] {
            let booleanQ = BooleanQ(booleanLiteral: b)
            XCTAssertEqual(booleanQ.value, b)
        }
    }

    func testOperatorBooleanNegation() {
        for b in [false, true] {
            let booleanQ = BooleanQ(booleanLiteral: b)
            let result = !booleanQ
            XCTAssertEqual(result.value, !b)
        }
    }

    func testOperatorBooleanAnd1() {
        for b1 in [false, true] {
            for b2 in [false, true] {
                let booleanQ1 = BooleanQ(booleanLiteral: b1)
                let booleanQ2 = BooleanQ(booleanLiteral: b2)
                let result = booleanQ1 && booleanQ2
                XCTAssertEqual(result.value, b1 && b2)
            }
        }
    }

    func testOperatorBooleanAnd2() {
        for b1 in [false, true] {
            for b2 in [false, true] {
                let booleanQ = BooleanQ(booleanLiteral: b1)
                let result = booleanQ && b2
                XCTAssertEqual(result.value, b1 && b2)
            }
        }
    }

    func testOperatorBooleanAnd3() {
        for b1 in [false, true] {
            for b2 in [false, true] {
                let booleanQ = BooleanQ(booleanLiteral: b2)
                let result = b1 && booleanQ
                XCTAssertEqual(result.value, b1 && b2)
            }
        }
    }

    func testOperatorBooleanOr1() {
        for b1 in [false, true] {
            for b2 in [false, true] {
                let booleanQ1 = BooleanQ(booleanLiteral: b1)
                let booleanQ2 = BooleanQ(booleanLiteral: b2)
                let result = booleanQ1 || booleanQ2
                XCTAssertEqual(result.value, b1 || b2)
            }
        }
    }

    func testOperatorBooleanOr2() {
        for b1 in [false, true] {
            for b2 in [false, true] {
                let booleanQ = BooleanQ(booleanLiteral: b1)
                let result = booleanQ || b2
                XCTAssertEqual(result.value, b1 || b2)
            }
        }
    }

    func testOperatorBooleanOr3() {
        for b1 in [false, true] {
            for b2 in [false, true] {
                let booleanQ = BooleanQ(booleanLiteral: b2)
                let result = b1 || booleanQ
                XCTAssertEqual(result.value, b1 || b2)
            }
        }
    }

    func testDescription() {
        for b in [false, true] {
            let booleanQ = BooleanQ(b)
            XCTAssertEqual(booleanQ.description, b.description)
        }
    }

    func testEquatable() {
        for b1 in [false, true] {
            for b2 in [false, true] {
                let booleanQ1 = BooleanQ(b1)
                let booleanQ2 = BooleanQ(b2)
                XCTAssertEqual(booleanQ1 == booleanQ2, b1 == b2)
            }
        }
    }

    func testComparable() {
        for b1 in [false, true] {
            for b2 in [false, true] {
                let booleanQ1 = BooleanQ(b1)
                let booleanQ2 = BooleanQ(b2)
                XCTAssertTrue( (booleanQ1 < booleanQ2) == (!b1 && b2) )
            }
        }
    }

    func testHashable() {
        for b in [false, true] {
            let booleanQ = BooleanQ(b)
            XCTAssertEqual(booleanQ.hashValue, b.hashValue)
        }
    }

}


