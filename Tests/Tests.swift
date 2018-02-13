import XCTest

class Tests: XCTestCase {
    func testDateComponentisation() {
        // 21st of December 2017 12:00
        let date = Date(timeIntervalSince1970: 1513854000)
        date.components()
    }

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

    func testRepetition() {
        var string = "b"
        4.times {
            string.append("a")
        }

        XCTAssertEqual("baaaa", string)
    }

    func testIteration() {
        var count = 0
        var accumulator = 0

        20.times {
            count += 1
        }

        // i is 0-indexed.
        3.times { i in
            accumulator += (i + 1)
        }

        XCTAssertEqual(count, 20)
        XCTAssertEqual(accumulator, 6)
    }
}
