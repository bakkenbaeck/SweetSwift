//
//  StringTests.swift
//  Tests
//
//  Created by Igor Ranieri on 23.05.19.
//

import XCTest
@testable import SweetSwift

class StringTests: XCTestCase {
    let prefix = "prefix: "

    func testPrepending() {
        var mutableString = "a string that I can change"

        XCTAssertFalse(mutableString.hasPrefix(self.prefix))
        mutableString.prepend(self.prefix)
        XCTAssertTrue(mutableString.hasPrefix(self.prefix))
        XCTAssertEqual(mutableString, "prefix: a string that I can change")
    }

    func testImmutableString() {
        let immutableString = "can't be modified"

        XCTAssertFalse(immutableString.hasPrefix(self.prefix))
        let modifiedString = immutableString.prepending(self.prefix)
        XCTAssertFalse(immutableString.hasPrefix(self.prefix))
        XCTAssertTrue(modifiedString.hasPrefix(self.prefix))
        XCTAssertEqual(immutableString, "can't be modified")
        XCTAssertEqual(modifiedString, "prefix: can't be modified")
    }
}
