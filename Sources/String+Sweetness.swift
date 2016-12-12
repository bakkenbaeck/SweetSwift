public extension String {
    public var length: Int {
        return self.characters.count
    }

    public var paddedForBase64: String {
        guard let stringData = data(using: .utf8) else { return self }
        
        let padLength = stringData.count % 3

        if padLength == 0 {
            return self
        }

        return self.padding(toLength: self.length + padLength, withPad: "=", startingAt: 0)
    }
}
