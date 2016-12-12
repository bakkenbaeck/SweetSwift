public extension String {
    public var length: Int {
        return self.characters.count
    }

    public var paddedForBase64: String {
        let padLength = self.length & 3

        return self.padding(toLength: self.length + padLength, withPad: "=", startingAt: self.length)
    }
}
