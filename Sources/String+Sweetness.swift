public extension String {
    public var length: Int {
        return self.characters.count
    }

    public subscript(i: Int) -> String? {
        let count = self.characters.count
        guard i >= 0 && i < count else { return nil }

        let index = self.index(self.startIndex, offsetBy: i)
        let range = self.rangeOfComposedCharacterSequence(at: index)

        return self.substring(with: range)
    }

    subscript(range: Range<Int>) -> String {
        let lowerIndex = index(startIndex, offsetBy: max(0,range.lowerBound), limitedBy: endIndex) ?? endIndex
        return substring(with: lowerIndex..<(index(lowerIndex, offsetBy: range.upperBound - range.lowerBound, limitedBy: endIndex) ?? endIndex))
    }

    subscript(range: ClosedRange<Int>) -> String {
        let lowerIndex = index(startIndex, offsetBy: max(0,range.lowerBound), limitedBy: endIndex) ?? endIndex
        return substring(with: lowerIndex..<(index(lowerIndex, offsetBy: range.upperBound - range.lowerBound + 1, limitedBy: endIndex) ?? endIndex))
    }
}
