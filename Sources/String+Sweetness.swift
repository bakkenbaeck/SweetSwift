public extension String {
    public var length: Int {
        return self.characters.count
    }
    
    func localized() -> String {
        return NSLocalizedString(self, comment: "")
    }   
}
