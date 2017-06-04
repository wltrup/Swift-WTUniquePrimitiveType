import UIKit
import XCTest
import WTUniquePrimitiveType

class SetSupportTests: XCTestCase {

    func testBoxing() {
        let set: Set<Double> = Set([100.0, 200.0, 300.0])
        let coreTemps: Set<UserCoreTemperature> = set.boxed()
        let setValues = set.map{$0}.sorted()
        let coreTempValues = coreTemps.map{$0.value}.sorted()
        let result = Array(zip(coreTempValues, setValues))
            .map { $0.0 == $0.1 }
            .reduce(true) { $0 && $1 }
        XCTAssertTrue(result)
    }

    func testUnboxing() {
        let set1: Set<Double> = Set([100.0, 200.0, 300.0])
        let coreTemps: Set<UserCoreTemperature> = set1.boxed()
        let set2: Set<Double> = coreTemps.unboxed()
        let set1Values = set1.map{$0}.sorted()
        let set2Values = set2.map{$0}.sorted()
        let result = Array(zip(set1Values, set2Values))
            .map { $0.0 == $0.1 }
            .reduce(true) { $0 && $1 }
        XCTAssertTrue(result)
    }
    
}


