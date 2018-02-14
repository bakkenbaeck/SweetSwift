public extension String {
    @available(*, deprecated: 4.0, message: "Please use the native count method directly instead.")
    public var length: Int {
        return self.count
    }
}
