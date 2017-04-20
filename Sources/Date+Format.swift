import Foundation

extension Date {
    func asISO8601Date() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"

        return formatter.string(from: self)
    }

    func asISO8601DateTime() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm"

        return formatter.string(from: self)
    }
}
