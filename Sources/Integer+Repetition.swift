public extension Int {
    public func times(_ closure: () -> Void) {
        guard self > 0 else { return }

        for _ in 0 ..< self {
            closure()
        }
    }

    public func times(_ closure: (_ i: Int) -> Void) {
        guard self > 0 else { return }

        for i in 0 ..< self {
            closure(i)
        }
    }
}
