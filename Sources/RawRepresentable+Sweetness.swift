public extension RawRepresentable where RawValue: Integer {
    public static var count: Int {
        var i: RawValue = 0
        while let _ = Self(rawValue: i) {
            i = 1 + i
        }
        return Int(i.toIntMax())
    }
}
