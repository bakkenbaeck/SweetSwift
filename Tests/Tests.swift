import XCTest

class Tests: XCTestCase {
    func testRawRepresentable_Sweetness() {
        enum CountableEnum: Int {
            case firstCase
            case secondCase
        }

        XCTAssertEqual(CountableEnum.count, 2)
    }
}
