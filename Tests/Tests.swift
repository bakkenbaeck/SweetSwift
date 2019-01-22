import XCTest
@testable import SweetSwift

class Tests: XCTestCase {
    func testDateComponentisation() {
        // 21st of December 2017 12:00 +0000
        let date = Date(timeIntervalSince1970: 1513854000)
        let components = date.components([.day, .month, .year, .calendar])

        XCTAssertEqual(components.day, 21)
        XCTAssertEqual(components.month, 12)
        XCTAssertEqual(components.year, 2017)
    }


    func testStringLength() {
        let string = "twentyfour length string"

        XCTAssertEqual(string.count, 24)
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
