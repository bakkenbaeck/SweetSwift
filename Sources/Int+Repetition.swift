public extension Int {
    
    /// Runs a closure the callee's number of times.
    ///
    /// - Parameter closure: The closure to execute
    public func times(_ closure: () -> Void) {
        guard self > 0 else { return }

        for _ in 0 ..< self {
            closure()
        }
    }

    /// Runs a closure the callee's number of times.
    ///
    /// - Parameter closure: The closure to execute
    ///                      parameter: The zero-indexed current index of repetitions.
    public func times(_ closure: (_ i: Int) -> Void) {
        guard self > 0 else { return }

        for i in 0 ..< self {
            closure(i)
        }
    }
    
    /// Creates an array of a generic type by running a closure the callee's number of times.
    ///
    /// - Parameter closure: The closure to run
    /// - Returns: The array of created items of the given type.
    public func map<T>(_ closure: () -> T)  -> [T] {
        var items = [T]()
        for _ in 0..<self {
            let item = closure()
            items.append(item)
        }
        
        return items
    }
    
    /// Creates an array of a generic type by running a closure the callee's number of times
    ///
    /// - Parameter closure: The closure to run
    ///                      parameter: The zero-indexed current index of repetitions.
    /// - Returns: The array of created items of the given type.
    public func map<T>(_ closure: (_ i: Int) -> T)  -> [T] {
        var items = [T]()
        for index in 0..<self {
            let item = closure(index)
            items.append(item)
        }
        
        return items
    }
}
