public extension Date {
    public func components(_ components: Set<Calendar.Component>, calendar: Calendar = .current) -> DateComponents {
        return calendar.dateComponents(components, from: self)
    }
}
