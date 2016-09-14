import XCTest

class Tests: XCTestCase {
    func testEnumCount() {
        enum Enum1: Int {
            case first
            case second
        }

        XCTAssertEqual(Enum1.count, 2)

        enum Enum2: Int {
            case first = 3
            case second = 6
        }

        XCTAssertEqual(Enum2.count, 2)
    }

    func testString_Sweetness() {
        let string = "twentyfour length string"

        XCTAssertEqual(string.length, 24)
    }
}
