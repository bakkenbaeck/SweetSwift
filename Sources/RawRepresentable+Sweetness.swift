@available(swift, deprecated: 4.2, message: "Use `CaseIterable`'s `allCases` for a much more flexible way of getting the count of cases in an enum")
public extension RawRepresentable where RawValue: BinaryInteger {
    /// Returns the amount of cases defined in an enum whose rawValues
    /// are integers.
    public static var count: Int64 {
        var i: RawValue = 0 as! Self.RawValue
        while let _ = Self(rawValue: i) {
            i = i.advanced(by: 1)
        }
        return Int64(i)
    }
}
