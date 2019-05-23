//
//  StringTests.swift
//  Tests
//
//  Created by Igor Ranieri on 23.05.19.
//

import XCTest
@testable import SweetSwift

class StringTests: XCTestCase {
    let prefix = "prefix:"

    func testPrepending() {
        var mutableString = "a string that I can change"

        XCTAssertFalse(mutableString.hasPrefix(prefix))
        mutableString.prepend(prefix)
        XCTAssertTrue(mutableString.hasPrefix(prefix))
    }

    func testImmutableString() {
        let immutableString = "can't be modified"

        XCTAssertFalse(immutableString.hasPrefix(prefix))
        let modifiedString = immutableString.prepending(prefix)
        XCTAssertFalse(immutableString.hasPrefix(prefix))
        XCTAssertTrue(modifiedString.hasPrefix(prefix))
    }
}
