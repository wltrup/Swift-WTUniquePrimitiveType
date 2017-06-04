import UIKit
import XCTest
import WTUniquePrimitiveType

class UniqueBooleanTypeTests: XCTestCase {

    func testThatItCreatesTheCorrectInstance() {
        let value: Bool = true
        let isConnected = UserConnected(value)
        XCTAssertEqual(isConnected.value, value)
    }

    func testDescription() {
        let value: Bool = true
        let isConnected = UserConnected(value)
        XCTAssertEqual(isConnected.description, value.description)
    }

    func testEquatable() {
        let value1: Bool = true
        let isConnected1 = UserConnected(value1)
        let value2: Bool = true
        let isConnected2 = UserConnected(value2)
        XCTAssertTrue(isConnected1 == isConnected2)
    }

    func testNotEquatable() {
        let value1: Bool = false
        let isConnected1 = UserConnected(value1)
        let value2: Bool = true
        let isConnected2 = UserConnected(value2)
        XCTAssertFalse(isConnected1 == isConnected2)
    }

    func testHashable() {
        let value: Bool = true
        let isConnected = UserConnected(value)
        XCTAssertEqual(isConnected.hashValue, value.hashValue)
    }

}
