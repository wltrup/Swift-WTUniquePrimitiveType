//
//  SetSupportTests.swift
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

class SetSupportTests: XCTestCase {

    func testBoxing() {
        let set: Set<Double> = Set([100.0, 200.0, 300.0])
        let floatingPointQs: Set<FloatingPointQ> = set.boxed()
        let setValues = set.map {$0}.sorted()
        let floatingPointQValues = floatingPointQs.map {$0.value}.sorted()
        XCTAssertEqual(floatingPointQValues, setValues)
    }

    func testUnboxing() {
        let set1: Set<Double> = Set([100.0, 200.0, 300.0])
        let floatingPointQs: Set<FloatingPointQ> = set1.boxed()
        let set2: Set<Double> = floatingPointQs.unboxed()
        XCTAssertEqual(set2, set1)
    }

}


