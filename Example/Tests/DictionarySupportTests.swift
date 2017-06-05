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
        let dict: [Bool: Double] = [false: 1.0, true: 5.0]
        let coreTemps: [ReactorConnected: ReactorCoreTemperature] = dict.boxed()
        let origKeys = Array(dict.keys).sorted()
        let boxedKeys = coreTemps.keys.map {$0.value}.sorted()
        XCTAssertEqual(boxedKeys, origKeys)
        let origVals = Array(dict.values).sorted()
        let boxedVals = coreTemps.values.map {$0.value}.sorted()
        XCTAssertEqual(boxedVals, origVals)
    }

    func testUnboxingWhenBothKeyAndValueTypesAreUniquePrimitiveTypes() {
        let dict1: [Bool: Double] = [false: 1.0, true: 5.0]
        let coreTemps: [ReactorConnected: ReactorCoreTemperature] = dict1.boxed()
        let dict2: [Bool: Double] = coreTemps.unboxed()
        XCTAssertEqual(dict2, dict1)
    }

//    func testHashingWhenBothKeyAndValueTypesAreUniquePrimitiveTypes() {
//        let dict: [Bool: Double] = [false: 1.0, true: 5.0]
//        let coreTemps: [ReactorConnected: ReactorCoreTemperature] = dict.boxed()
//        let origKeys = Array(dict.keys).sorted()
//        let origVals = Array(dict.values).sorted()
//        let expected = zip(origKeys, origVals)
//            .map { $0.0.hashValue ^ $0.1.hashValue }
//            .reduce(1.hashValue) { $0 ^ $1 }
//        XCTAssertEqual(coreTemps.hashValue, expected)
//    }

    func testBoxingWhenOnlyKeyTypesIsAUniquePrimitiveType() {
        let dict: [Bool: Double] = [false: 1.0, true: 5.0]
        let coreTemps: [ReactorConnected: Double] = dict.boxed()
        let origKeys = Array(dict.keys).sorted()
        let boxedKeys = coreTemps.keys.map {$0.value}.sorted()
        XCTAssertEqual(boxedKeys, origKeys)
        let origVals = Array(dict.values).sorted()
        let boxedVals = coreTemps.values.map {$0}.sorted()
        XCTAssertEqual(boxedVals, origVals)
    }

    func testUnboxingWhenOnlyKeyTypesIsAUniquePrimitiveType() {
        let dict1: [Bool: Double] = [false: 1.0, true: 5.0]
        let coreTemps: [ReactorConnected: Double] = dict1.boxed()
        let dict2: [Bool: Double] = coreTemps.unboxed()
        XCTAssertEqual(dict2, dict1)
    }

//    func testHashingWhenOnlyKeyTypesIsAUniquePrimitiveType() {
//        let dict: [Bool: Double] = [false: 1.0, true: 5.0]
//        let coreTemps: [ReactorConnected: Double] = dict.boxed()
//        let origKeys = Array(dict.keys).sorted()
//        let origVals = Array(dict.values).sorted()
//        let expected = zip(origKeys, origVals)
//            .map { $0.0.hashValue ^ $0.1.hashValue }
//            .reduce(1.hashValue) { $0 ^ $1 }
//        XCTAssertEqual(coreTemps.hashValue, expected)
//    }

    func testBoxingWhenOnlyValueTypesIsAUniquePrimitiveType() {
        let dict: [Bool: Double] = [false: 1.0, true: 5.0]
        let coreTemps: [Bool: ReactorCoreTemperature] = dict.boxed()
        let origKeys = Array(dict.keys).sorted()
        let boxedKeys = coreTemps.keys.map {$0}.sorted()
        XCTAssertEqual(boxedKeys, origKeys)
        let origVals = Array(dict.values).sorted()
        let boxedVals = coreTemps.values.map {$0.value}.sorted()
        XCTAssertEqual(boxedVals, origVals)
    }

    func testUnboxingWhenOnlyValueTypesIsAUniquePrimitiveType() {
        let dict1: [Bool: Double] = [false: 1.0, true: 5.0]
        let coreTemps: [Bool: ReactorCoreTemperature] = dict1.boxed()
        let dict2: [Bool: Double] = coreTemps.unboxed()
        XCTAssertEqual(dict2, dict1)
    }

//    func testHashingWhenOnlyValueTypesIsAUniquePrimitiveType() {
//        let dict: [Bool: Double] = [false: 1.0, true: 5.0]
//        let coreTemps: [Bool: ReactorCoreTemperature] = dict.boxed()
//        let origKeys = Array(dict.keys).sorted()
//        let origVals = Array(dict.values).sorted()
//        let expected = zip(origKeys, origVals)
//            .map { $0.0.hashValue ^ $0.1.hashValue }
//            .reduce(1.hashValue) { $0 ^ $1 }
//        XCTAssertEqual(coreTemps.hashValue, expected)
//    }

}


