public extension Int {
    
    public enum ZeroPaddingError: Error {
        case invalidMinimumCharacterCount
        
        public var description: String {
            switch self {
            case .invalidMinimumCharacterCount:
                return "You need to pass in a character count of at least 1 - otherwise you might as well just use string interpolation."
            }
        }
    }
    
    /// Takes an integer and zero-pads the front of the string for the minimum number of characters.
    ///
    /// - Parameter minimumCharacters: The minimum number of characters to display.
    /// - Returns: The zero-padded string.
    /// - Throws: An error if an invalid minimum number of characters is passed in (ie, zero or fewer)
    public func zeroPaddedString(minimumCharacters: Int) throws -> String {
        guard minimumCharacters > 0 else {
            throw ZeroPaddingError.invalidMinimumCharacterCount
        }
        
        return String(format: "%0\(minimumCharacters)d", self)
    }
}
