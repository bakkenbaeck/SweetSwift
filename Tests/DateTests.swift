//
//  DateTests.swift
//  Tests
//
//  Created by Ellen Shapiro on 1/22/19.
//

import SweetSwift
import XCTest

class DateTests: XCTestCase {
    
    func testDateComponentisation() {
        // 21st of December 2017 12:00 +0000 CET
        let date = Date(timeIntervalSince1970: 1513854000)
        
        let cet = TimeZone(identifier: "Europe/Amsterdam")!
        let components = date.components([.day, .month, .year, .hour, .calendar], timeZone: cet)
        XCTAssertEqual(components.day, 21)
        XCTAssertEqual(components.month, 12)
        XCTAssertEqual(components.year, 2017)
        XCTAssertEqual(components.hour, 12)
        
        // GMT is one hour behind CET
        let gmt = TimeZone(secondsFromGMT: 0)!
        let gmtComponents = date.components([.day, .month, .year, .hour, .calendar], timeZone: gmt)
        XCTAssertEqual(gmtComponents.day, 21)
        XCTAssertEqual(gmtComponents.month, 12)
        XCTAssertEqual(gmtComponents.year, 2017)
        XCTAssertEqual(gmtComponents.hour, 11)
        
        // New Zealand is 13h ahead of GMT in December.
        let newZealandTime = TimeZone(identifier: "Pacific/Auckland")!
        let newZealandComponents = date.components([.day, .month, .year, .hour, .calendar], timeZone: newZealandTime)
        
        XCTAssertEqual(newZealandComponents.day, 22)
        XCTAssertEqual(newZealandComponents.month, 12)
        XCTAssertEqual(newZealandComponents.year, 2017)
        XCTAssertEqual(newZealandComponents.hour, 0)
    }

    func testCreatingDateWithDefaultParams() throws {
        // 21st of December 2017 00:00 +0000 UTC
        let dateFromTimestamp = Date(timeIntervalSince1970: 1513814400)
        
        let gmt = TimeZone(secondsFromGMT: 0)!
        let dateFromExtension = try Date.from(day: 21,
                                              month: 12,
                                              year: 2017,
                                              componentTimeZone: gmt,
                                              calendarTimeZone: gmt)
        
        XCTAssertEqual(dateFromExtension, dateFromTimestamp)
    }
    
    func testCreatingDateWithAllParams() throws {
        // 21-12-2017 01:02:03 +0000 UTC
        let dateFromTimestamp = Date(timeIntervalSince1970: 1513818123)
        
        let gmt = TimeZone(secondsFromGMT: 0)!
        let dateFromExtension = try Date.from(day: 21,month: 12,
                                              year: 2017,
                                              hour: 1,
                                              minute: 2,
                                              second: 3,
                                              componentTimeZone: gmt,
                                              calendarTimeZone: gmt)
        
        XCTAssertEqual(dateFromExtension, dateFromTimestamp)
    }
    
    func testCreatingDateWithCurrentTimeZone() throws {
        // By default, a formatter will use the current time zone when trying to create a date
        // if one isn't provided in the format.
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyy HH:mm:ss"
        
        let dateString = "21-12-2017 12:13:14"
        guard let dateFromFormatter = formatter.date(from: dateString) else {
            XCTFail("Couldn't create date from date string!")
            return
        }
        
        let dateFromExtension = try Date.from(day: 21,
                                              month: 12,
                                              year: 2017,
                                              hour: 12,
                                              minute: 13,
                                              second: 14)
        
        XCTAssertEqual(dateFromFormatter, dateFromExtension)
    }
    
    func testCreatingDateWithInvalidDataWraps() throws {
        let secondWrap = try Date.from(day: 21, month: 12, year: 2017, hour: 1, minute: 2, second: 300)
        let expectedSecondResult = try Date.from(day: 21, month: 12, year: 2017, hour: 1, minute: 7, second: 0)
        XCTAssertEqual(secondWrap, expectedSecondResult)
        
        let minuteWrap = try Date.from(day: 21, month: 12, year: 2017, hour: 1, minute: 125, second: 3)
        let expectedMinuteResult = try Date.from(day: 21, month: 12, year: 2017, hour: 3, minute: 5, second: 3)
        XCTAssertEqual(minuteWrap, expectedMinuteResult)
        
        let hourWrap = try Date.from(day: 21, month: 12, year: 2017, hour: 263, minute: 2, second: 3)
        let expectedHourResult = try Date.from(day: 31, month: 12, year: 2017, hour: 23, minute: 2, second: 3)
        XCTAssertEqual(hourWrap, expectedHourResult)
        
        let dayWrap = try Date.from(day: 35, month: 12, year: 2017)
        let expectedDayResult = try Date.from(day: 4, month: 1, year: 2018)
        XCTAssertEqual(dayWrap, expectedDayResult)
        
        let monthWrap = try Date.from(day: 21, month: 14, year: 2017)
        let expectedMonthResult = try Date.from(day: 21, month: 2, year: 2018)
        XCTAssertEqual(monthWrap, expectedMonthResult)
        
        let monthWrapNegative = try Date.from(day: 21, month: -1, year: 2017)
        let expectedNegativeMonthResult = try Date.from(day: 21, month: 11, year: 2016)
        XCTAssertEqual(monthWrapNegative, expectedNegativeMonthResult)
    }
}
