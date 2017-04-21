import Foundation

extension Data {
    public func base64EncodedStringWithoutPadding() -> String {
        let base64 = self.base64EncodedString()
        if base64.hasSuffix("==") {
            return base64.substring(to: base64.index(base64.endIndex, offsetBy: -2))
        } else if base64.hasSuffix("=") {
            return base64.substring(to: base64.index(base64.endIndex, offsetBy: -1))
        }

        return base64
    }
}
