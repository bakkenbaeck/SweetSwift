public extension Date {
    
    /// A date components object with the information from the given parametrs.
    ///
    /// - Parameters:
    ///   - components: The components to fetch for the callee.
    ///   - calendar: The calendar to use to get the date components. Defaults to `Calendar.current`
    ///   - timeZone: The time zone to use with the calendar to get the date components. Defaults to `Calendar.current`.
    /// - Returns: The retrieved components.
    public func components(_ components: Set<Calendar.Component>,
                           calendar: Calendar = .current,
                           timeZone: TimeZone = .current) -> DateComponents {
        var mutableCalendar = calendar
        mutableCalendar.timeZone = timeZone
        return mutableCalendar.dateComponents(components, from: self)
    }
    
    enum DateCreationError: Error {
        case invalidComponents(day: Int, month: Int, year: Int, hour: Int, minute: Int, second: Int)
        
        var description: String {
            switch self {
            case .invalidComponents(let day, let month, let year, let hour, let minute, let second):
                let zeroPaddedHour = try? hour.zeroPaddedString(minimumCharacters: 2)
                let zeroPaddedMinute = try? minute.zeroPaddedString(minimumCharacters: 2)
                let zeroPaddedSecond = try? second.zeroPaddedString(minimumCharacters: 2)
                return "Components invalid for \(day)-\(month)-\(year) \(zeroPaddedHour ?? ""):\(zeroPaddedMinute ?? ""):\(zeroPaddedSecond ?? "")"
                
            }
        }
    }
    
    /// Creates a date based on the passed in parameters.
    ///
    /// NOTE: Due to underlying behavior by `DateComponents`, if you pass in something ridiculous, it'll wrap to the
    //        next reasonable value for that component. For example if you pass in
    ///       `Date.from(day: 21, month: 14, year: 2017)`, you'll get back a date of 2 February 2018.
    ///
    /// - Parameters:
    ///   - day: The day to use.
    ///   - month: The month to use.
    ///   - year: The year to use.
    ///   - hour: The hour to use. Defaults to 0.
    ///   - minute: The minute to use. Defaults to 0.
    ///   - second: The second to use. Defaults to zero.
    ///   - componentTimeZone: The time zone to use with the `dateComponents` object. Defaults to `TimeZone.current`.
    ///   - calendarTimeZone: The time zone to use with the `calendar` object. Defaults to `TimeZone.current`.
    ///   - calendar: The calendar to use to create a date from the components. Defaults to `Calendar.current`.
    /// - Returns: The created date.
    /// - Throws: An error if a date could not be created
    public static func from(day: Int,
                            month: Int,
                            year: Int,
                            hour: Int = 0,
                            minute: Int = 0,
                            second: Int = 0,
                            componentTimeZone: TimeZone = .current,
                            calendarTimeZone: TimeZone = .current,
                            calendar: Calendar = .current) throws -> Date {
        var components = DateComponents()
        components.day = day
        components.month = month
        components.year = year
        components.hour = hour
        components.minute = minute
        components.second = second
        components.timeZone = componentTimeZone

        var mutableCalendar = calendar
        mutableCalendar.timeZone = calendarTimeZone
        
        guard let date = mutableCalendar.date(from: components) else {
            throw DateCreationError.invalidComponents(day: day,
                                                      month: month,
                                                      year: year,
                                                      hour: hour,
                                                      minute: minute,
                                                      second: second)
        }
        
        return date
    }
}
