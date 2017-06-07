//
//  DictionarySupportTests.swift
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

class DictionarySupportTests: XCTestCase {

    func testBoxingWhenBothKeyAndValueTypesAreUniquePrimitiveTypes() {
        let dict: [Bool: Int] = [false: 1, true: 5]
        let integerQs: [BooleanQ: IntegerQ] = dict.boxed()
        let origKeys = Array(dict.keys).sorted()
        let boxedKeys = integerQs.keys.map {$0.value}.sorted()
        XCTAssertEqual(boxedKeys, origKeys)
        let origVals = Array(dict.values).sorted()
        let boxedVals = integerQs.values.map {$0.value}.sorted()
        XCTAssertEqual(boxedVals, origVals)
    }

    func testUnboxingWhenBothKeyAndValueTypesAreUniquePrimitiveTypes() {
        let dict1: [Bool: Int] = [false: 1, true: 5]
        let integerQs: [BooleanQ: IntegerQ] = dict1.boxed()
        let dict2: [Bool: Int] = integerQs.unboxed()
        XCTAssertEqual(dict2, dict1)
    }

    func testHashingWhenBothKeyAndValueTypesAreUniquePrimitiveTypes() {
        let dict: [Bool: Int] = [false: 1, true: 5]
        let integerQs: [BooleanQ: IntegerQ] = dict.boxed()
        let origKeys = Array(dict.keys).sorted()
        let origVals = Array(dict.values).sorted()
        let expected = zip(origKeys, origVals)
            .map { $0.0.hashValue ^ $0.1.hashValue }
            .reduce(1.hashValue) { $0 ^ $1 }
        XCTAssertEqual(integerQs.hashValue, expected)
    }

    func testBoxingWhenOnlyKeyTypesIsAUniquePrimitiveType() {
        let dict: [Bool: Int] = [false: 1, true: 5]
        let integerQs: [BooleanQ: Int] = dict.boxed()
        let origKeys = Array(dict.keys).sorted()
        let boxedKeys = integerQs.keys.map {$0.value}.sorted()
        XCTAssertEqual(boxedKeys, origKeys)
        let origVals = Array(dict.values).sorted()
        let boxedVals = integerQs.values.map {$0}.sorted()
        XCTAssertEqual(boxedVals, origVals)
    }

    func testUnboxingWhenOnlyKeyTypesIsAUniquePrimitiveType() {
        let dict1: [Bool: Int] = [false: 1, true: 5]
        let integerQs: [BooleanQ: Int] = dict1.boxed()
        let dict2: [Bool: Int] = integerQs.unboxed()
        XCTAssertEqual(dict2, dict1)
    }

    func testHashingWhenOnlyKeyTypesIsAUniquePrimitiveType() {
        let dict: [Bool: Int] = [false: 1, true: 5]
        let integerQs: [BooleanQ: Int] = dict.boxed()
        let origKeys = Array(dict.keys).sorted()
        let origVals = Array(dict.values).sorted()
        let expected = zip(origKeys, origVals)
            .map { $0.0.hashValue ^ $0.1.hashValue }
            .reduce(1.hashValue) { $0 ^ $1 }
        XCTAssertEqual(integerQs.hashValue, expected)
    }

    func testBoxingWhenOnlyValueTypesIsAUniquePrimitiveType() {
        let dict: [Bool: Int] = [false: 1, true: 5]
        let integerQs: [Bool: IntegerQ] = dict.boxed()
        let origKeys = Array(dict.keys).sorted()
        let boxedKeys = integerQs.keys.map {$0}.sorted()
        XCTAssertEqual(boxedKeys, origKeys)
        let origVals = Array(dict.values).sorted()
        let boxedVals = integerQs.values.map {$0.value}.sorted()
        XCTAssertEqual(boxedVals, origVals)
    }

    func testUnboxingWhenOnlyValueTypesIsAUniquePrimitiveType() {
        let dict1: [Bool: Int] = [false: 1, true: 5]
        let integerQs: [Bool: IntegerQ] = dict1.boxed()
        let dict2: [Bool: Int] = integerQs.unboxed()
        XCTAssertEqual(dict2, dict1)
    }

    func testHashingWhenOnlyValueTypesIsAUniquePrimitiveType() {
        let dict: [Bool: Int] = [false: 1, true: 5]
        let integerQs: [Bool: IntegerQ] = dict.boxed()
        let origKeys = Array(dict.keys).sorted()
        let origVals = Array(dict.values).sorted()
        let expected = zip(origKeys, origVals)
            .map { $0.0.hashValue ^ $0.1.hashValue }
            .reduce(1.hashValue) { $0 ^ $1 }
        XCTAssertEqual(integerQs.hashValue, expected)
    }

    func testCounting() {
        let dict: [Int: Item] = [ 10: Item(), 20: Item(), 30: Item(), 40: Item() ]
        XCTAssertEqual(dict.typesafeCount.valueAsInt, dict.count)
        XCTAssertEqual(dict.typesafeKeyCount.valueAsInt, dict.keys.count)
        XCTAssertEqual(dict.typesafeValueCount.valueAsInt, dict.values.count)
    }

}


