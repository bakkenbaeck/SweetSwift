import Foundation
import XCTest

class CollectionTypeTests: XCTestCase {
    func testEnumerateWithNext() {
        let someArray = [1,2,3]
        for (current, next) in someArray.enumeratedWithNext() {
            XCTAssert(current == 1)
            XCTAssert(next == 2)
            break
        }

        for (current, next) in someArray.enumeratedWithNext() {
            if current == 2 {
                XCTAssert(next == 3)
            }
            break
        }
    }
}
