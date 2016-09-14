public extension RawRepresentable where RawValue: Integer {
    /// Returns the amount of cases defined in an enum whose rawValues
    /// are integers.
    public static var count: Int {
        var i: RawValue = 0
        while let _ = Self(rawValue: i) {
            i = i.advanced(by: 1)
        }
        return Int(i.toIntMax())
    }
}
