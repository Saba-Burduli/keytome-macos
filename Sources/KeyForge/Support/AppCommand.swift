import Foundation

enum AppCommand: String {
    case commandPalette
    case search
    case copy
    case next
    case previous
    case nextPack
    case previousPack
    case first
    case last
    case help

    static let notification = Notification.Name("KeyForge.AppCommand")

    func send() {
        NotificationCenter.default.post(name: Self.notification, object: rawValue)
    }
}
