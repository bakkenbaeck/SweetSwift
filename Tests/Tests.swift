import XCTest

class Tests: XCTestCase {
    func testEnumCount() {
        enum Enum1: Int {
            case first
            case second
        }

        XCTAssertEqual(Enum1.count, 2)

        // The cases bellow are not supported by this extension
        // if you have any idea on how to make them work in a good
        // way, go for it.

        enum Enum2: Int {
            case first = 3
            case second = 6
        }

        XCTAssertEqual(Enum2.count, 0)

        enum Enum3: Int {
            case first
            case second = 6
        }

        XCTAssertEqual(Enum3.count, 1)
    }

    func testStringLength() {
        let string = "twentyfour length string"

        XCTAssertEqual(string.length, 24)
    }

    func testValidEmail() {
        let validEmail = "marijn@bakkenbaeck.no"
        let validEmail2 = "marijn@bakkenbaeck.amsterdam"
        let invalidEmail = "invalidE@mail.n"
        let invalidEmail2 = "invalidEmail.nl"
        let invalidEmail3 = "@invalidEmail.nl"
        let invalidEmail4 = "invalid@@Email.nl"

        XCTAssertTrue(validEmail.isValidEmail)
        XCTAssertTrue(validEmail2.isValidEmail)
        XCTAssertFalse(invalidEmail.isValidEmail)
        XCTAssertFalse(invalidEmail2.isValidEmail)
        XCTAssertFalse(invalidEmail3.isValidEmail)
        XCTAssertFalse(invalidEmail4.isValidEmail)
    }
}
