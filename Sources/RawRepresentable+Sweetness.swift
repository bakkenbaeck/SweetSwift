extension RawRepresentable where RawValue: IntegerType {
    static var count: Int {
        var i: RawValue = 0
        while let _ = Self(rawValue: i) {
            i = i.successor()
        }
        return Int(i.toIntMax())
    }
}