import UIKit
import XCTest
import WTUniquePrimitiveType

class ArraySupportTests: XCTestCase {

    func testBoxing() {
        let array = [1, 2, 3]
        let userIds: [UserId] = array.boxed()
        let result = zip(userIds, array)
            .map { (userId, intValue) -> Bool in return userId.value == intValue }
            .reduce(true) { (result, curValue) -> Bool in return result && curValue }
        XCTAssertTrue(result)
    }

    func testUnboxing() {
        let array1 = [1, 2, 3]
        let userIds: [UserId] = array1.boxed()
        let array2: [Int] = userIds.unboxed()
        let result = zip(array1, array2)
            .map { (intValue1, intValue2) -> Bool in return intValue1 == intValue2 }
            .reduce(true) { (result, curValue) -> Bool in return result && curValue }
        XCTAssertTrue(result)
    }

    func testHashing() {
        let array = [1, 2, 3]
        let userIds: [UserId] = array.boxed()
        let expected = array.map { $0.hashValue }.reduce(1.hashValue) { return $0 ^ $1 }
        XCTAssertTrue(userIds.hashValue == expected)
    }
    
}


