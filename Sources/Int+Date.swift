//
//  Int+Date.swift
//  Tests
//
//  Created by Igor Ranieri on 09.04.18.
//

import Foundation

extension Int {
    /// Returns a TimeInterval for an approximate number of days.
    /// Ex: 3.days == 259200 seconds. Of courrse is not Date/Time aware. Use it with care.
    ///
    /// Same as .days, but for the sake of grammatical order, we have both plural and singular.
    var day: TimeInterval {
        return self.days
    }

    /// Returns a TimeInterval for an approximate number of days.
    /// Ex: 3.days == 259200 seconds. Of courrse is not Date/Time aware. Use it with care.
    var days: TimeInterval {
        return TimeInterval(self * 60 * 60 * 24)
    }
}
