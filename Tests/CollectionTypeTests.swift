import XCTest

class CollectionTypeTests: XCTestCase {
    func testEnumerateWithNext() {
        let array = [1,2,3]
        for (current, next) in array.enumeratedWithCurrentAndNext() {
            XCTAssert(current == 1)
            XCTAssert(next == 2)
            break
        }

        for (current, next) in array.enumeratedWithCurrentAndNext() {
            if current == 2 {
                XCTAssert(next == 3)
            }
            break
        }
    }
}
