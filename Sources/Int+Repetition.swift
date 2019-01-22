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
    
    public func map<T>(_ closure: () -> T)  -> [T] {
        var items = [T]()
        for _ in 0..<self {
            let item = closure()
            items.append(item)
        }
        
        return items
    }
}
