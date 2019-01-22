public extension Date {
    
    public func components(_ components: Set<Calendar.Component>,
                           calendar: Calendar = .current,
                           timeZone: TimeZone = .current) -> DateComponents {
        var mutableCalendar = calendar
        mutableCalendar.timeZone = timeZone
        return mutableCalendar.dateComponents(components, from: self)
    }
    }
}
