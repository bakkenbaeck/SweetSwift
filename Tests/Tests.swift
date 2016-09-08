import XCTest

class Tests: XCTestCase {
    func testRawRepresentable_Sweetness() {
        enum CountableEnum: Int {
            case firstCase
            case secondCase
        }

        XCTAssertEqual(CountableEnum.count, 2)
    }

    func testString_Sweetness() {
        let string = "twentyfour length string"

        XCTAssertEqual(string.length, 24)
    }
}
