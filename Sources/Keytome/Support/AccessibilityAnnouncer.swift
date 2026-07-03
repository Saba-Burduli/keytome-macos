import AppKit

enum AccessibilityAnnouncer {
    static func announce(_ message: String) {
        DispatchQueue.main.async {
            NSAccessibility.post(
                element: NSApp as Any,
                notification: .announcementRequested,
                userInfo: [
                    .announcement: message,
                    .priority: NSAccessibilityPriorityLevel.medium.rawValue
                ]
            )
        }
    }
}
