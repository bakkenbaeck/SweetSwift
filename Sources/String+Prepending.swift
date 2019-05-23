//
//  String+Prepending.swift
//  Tests
//
//  Created by Igor Ranieri on 23.05.19.
//

import Foundation

extension String {
    public mutating func prepend(_ aString: String) {
        self = aString.appending(self)
    }

    public func prepending(_ aString: String) -> String {
        return aString.appending(self)
    }
}
