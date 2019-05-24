//
//  String+Prepending.swift
//  Tests
//
//  Created by Igor Ranieri on 23.05.19.
//

import Foundation

extension String {
    /// Prepends the given string to this string.
    ///
    /// - Parameter aString: string to be prepended
    public mutating func prepend(_ aString: String) {
        self = aString.appending(self)
    }

    /// Returns a new string made by prepending a given string to the String.
    ///
    /// - Parameter aString: string to be prepended
    /// - Returns: a new string composed of the combined strings.
    public func prepending(_ aString: String) -> String {
        return aString.appending(self)
    }
}
