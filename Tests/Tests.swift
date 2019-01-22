import XCTest
@testable import SweetSwift

class Tests: XCTestCase {
    
    func testZeroPaddingSingleDigitInteger() throws {
        XCTAssertThrowsError(try 4.zeroPaddedString(minimumCharacters: 0))

        let oneCharacter = try 4.zeroPaddedString(minimumCharacters: 1)
        XCTAssertEqual(oneCharacter, "4")
    
        let twoCharacters = try 4.zeroPaddedString(minimumCharacters: 2)
        XCTAssertEqual(twoCharacters, "04")
        
        let threeCharaters = try 4.zeroPaddedString(minimumCharacters: 3)
        XCTAssertEqual(threeCharaters, "004")
    }
    
    func testZeroPaddingDoubleDigitInteger() throws {
        XCTAssertThrowsError(try 44.zeroPaddedString(minimumCharacters: 0))
        
        let oneCharacter = try 44.zeroPaddedString(minimumCharacters: 1)
        XCTAssertEqual(oneCharacter, "44")
        
        let twoCharacters = try 44.zeroPaddedString(minimumCharacters: 2)
        XCTAssertEqual(twoCharacters, "44")
        
        let threeCharaters = try 44.zeroPaddedString(minimumCharacters: 3)
        XCTAssertEqual(threeCharaters, "044")
    }

    func testMapWithoutParameter() {
        let array = 5.map { false }
        XCTAssertEqual(array, [ false, false, false, false, false ])
    }
    
    func testMapWithParameter() {
        func trueFalse(index: Int) -> Bool {
            if index % 2 == 0 {
                return true
            } else {
                return false
            }
        }
        
        
        let array = 5.map(trueFalse)
        
        XCTAssertEqual(array, [ true, false, true, false, true ])
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
