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

    func testBase64() {
        var string = "This is a test string"
        var string64 = string.data(using: .utf8)!.base64EncodedString()
        var string64NoPadding = string.data(using: .utf8)!.base64EncodedStringWithoutPadding()

        XCTAssertEqual(string64, "VGhpcyBpcyBhIHRlc3Qgc3RyaW5n")
        XCTAssertEqual(string64NoPadding, "VGhpcyBpcyBhIHRlc3Qgc3RyaW5n")
        XCTAssertEqual(string64NoPadding.paddedForBase64, "VGhpcyBpcyBhIHRlc3Qgc3RyaW5n=")

        string = "This is a test string without padding"
        string64 = string.data(using: .utf8)!.base64EncodedString()
        string64NoPadding = string.data(using: .utf8)!.base64EncodedStringWithoutPadding()

        XCTAssertEqual(string64, "VGhpcyBpcyBhIHRlc3Qgc3RyaW5nIHdpdGhvdXQgcGFkZGluZw==")
        XCTAssertEqual(string64NoPadding, "VGhpcyBpcyBhIHRlc3Qgc3RyaW5nIHdpdGhvdXQgcGFkZGluZw")
        XCTAssertEqual(string64NoPadding.paddedForBase64, "VGhpcyBpcyBhIHRlc3Qgc3RyaW5nIHdpdGhvdXQgcGFkZGluZw==")

        string = "One-pad string"
        string64 = string.data(using: .utf8)!.base64EncodedString()
        string64NoPadding = string.data(using: .utf8)!.base64EncodedStringWithoutPadding()

        XCTAssertEqual(string64, "T25lLXBhZCBzdHJpbmc=")
        XCTAssertEqual(string64NoPadding, "T25lLXBhZCBzdHJpbmc")
        XCTAssertEqual(string64NoPadding.paddedForBase64, "T25lLXBhZCBzdHJpbmc=")
    }
}
