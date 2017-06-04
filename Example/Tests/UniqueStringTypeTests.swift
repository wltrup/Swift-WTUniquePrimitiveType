import UIKit
import XCTest
import WTUniquePrimitiveType

class UniqueStringTypeTests: XCTestCase {

    func testThatItCreatesTheCorrectInstance() {
        let value: String = "John Doe"
        let userName = UserName(value)
        XCTAssertEqual(userName.value, value)
    }

    func testDescription() {
        let value: String = "John Doe"
        let userName = UserName(value)
        XCTAssertEqual(userName.description, value.description)
    }

    func testEquatable() {
        let value1: String = "John Doe"
        let userName1 = UserName(value1)
        let value2: String = "John Doe"
        let userName2 = UserName(value2)
        XCTAssertTrue(userName1 == userName2)
    }

    func testNotEquatable() {
        let value1: String = "Jane Doe"
        let userName1 = UserName(value1)
        let value2: String = "John Doe"
        let userName2 = UserName(value2)
        XCTAssertFalse(userName1 == userName2)
    }

    func testHashable() {
        let value: String = "John Doe"
        let userName = UserName(value)
        XCTAssertEqual(userName.hashValue, value.hashValue)
    }
    
}
