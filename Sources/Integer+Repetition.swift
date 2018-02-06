import Foundation

public extension Int {
    public func times(_ closure: () -> ()) {
        if self > 0 {
            for _ in 0..<self {
                closure()
            }
        }
    }

    public func times(_ closure: (_ i: Int) -> ()) {
        if self > 0 {
            for i in 0..<self {
                closure(i)
            }
        }
    }
}
