import Foundation

public struct Math {
    public static func degreesToRadians(_ degrees: Double) -> Double {
        return M_PI * degrees / 180.0
    }

    public static func radiansToDegrees(_ radians: Double) -> Double {
        return radians * 180 / M_PI
    }
}
