//
//  ArraySupportTests.swift
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

class ArraySupportTests: XCTestCase {

    func testBoxing() {
        let array = [10, 20, 30]
        let integerQs: [IntegerQ] = array.boxed()
        let result = zip(integerQs, array)
            .map { (integerQ, intValue) -> Bool in return integerQ.value == intValue }
            .reduce(true) { (result, curValue) -> Bool in return result && curValue }
        XCTAssertTrue(result)
    }

    func testUnboxing() {
        let array1 = [10, 20, 30]
        let integerQs: [IntegerQ] = array1.boxed()
        let array2: [Int] = integerQs.unboxed()
        let result = zip(array1, array2)
            .map { (intValue1, intValue2) -> Bool in return intValue1 == intValue2 }
            .reduce(true) { (result, curValue) -> Bool in return result && curValue }
        XCTAssertTrue(result)
    }

    func testCounting() {
        let array: [Item] = [ Item(), Item(), Item(), Item(), Item() ]
        XCTAssertEqual(array.uniqueCount.valueAsInt, array.count)
    }

    func testSubscript() {
        var array: [Int] = [ 10, 20, 30, 40, 50 ]
        let idx = 2
        let itemIndex = UniqueIntIndexType<Int>(idx)
        XCTAssertEqual(array[itemIndex], array[idx])
        let newValue = 100
        array[itemIndex] = newValue
        XCTAssertEqual(array[itemIndex], array[idx])
        XCTAssertEqual(array[itemIndex], newValue)
    }

    func testHashing() {
        let array = [10, 20, 30]
        let integerQs: [IntegerQ] = array.boxed()
        let expected = array.map { $0.hashValue }.reduce(1.hashValue) { return $0 ^ $1 }
        XCTAssertTrue(integerQs.hashValue == expected)
    }

}


