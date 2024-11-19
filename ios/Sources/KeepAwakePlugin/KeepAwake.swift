import Foundation

@objc public class KeepAwake: NSObject {
    @objc public func echo(_ value: String) -> String {
        print(value)
        return value
    }
}
