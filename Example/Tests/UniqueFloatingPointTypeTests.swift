import UIKit
import XCTest
import WTUniquePrimitiveType

class UniqueFloatingPointTypeTests: XCTestCase {

    func testThatItCreatesTheCorrectInstance() {
        let value: Double = 100
        let coreTemp = UserCoreTemperature(value)
        XCTAssertEqual(coreTemp.value, value)
    }

    func testDescription() {
        let value: Double = 100
        let userCoreTemp = UserCoreTemperature(value)
        XCTAssertEqual(userCoreTemp.description, value.description)
    }

    func testEquatable() {
        let value1: Double = 100
        let coreTemp1 = UserCoreTemperature(value1)
        let value2: Double = 100
        let coreTemp2 = UserCoreTemperature(value2)
        XCTAssertTrue(coreTemp1 == coreTemp2)
    }

    func testNotEquatable() {
        let value1: Double = 0
        let coreTemp1 = UserCoreTemperature(value1)
        let value2: Double = 100
        let coreTemp2 = UserCoreTemperature(value2)
        XCTAssertFalse(coreTemp1 == coreTemp2)
    }

    func testHashable() {
        let value: Double = 100
        let userCoreTemp = UserCoreTemperature(value)
        XCTAssertEqual(userCoreTemp.hashValue, value.hashValue)
    }
    
}
