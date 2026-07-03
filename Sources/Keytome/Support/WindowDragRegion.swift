import AppKit
import SwiftUI

struct WindowDragRegion: NSViewRepresentable {
    func makeNSView(context: Context) -> NSView {
        WindowDragView()
    }

    func updateNSView(_ nsView: NSView, context: Context) {}
}

private final class WindowDragView: NSView {
    override func acceptsFirstMouse(for event: NSEvent?) -> Bool {
        true
    }

    override func mouseDown(with event: NSEvent) {
        guard let window else { return }

        if event.clickCount == 2 {
            performPreferredDoubleClickAction(on: window)
        } else {
            window.performDrag(with: event)
        }
    }

    private func performPreferredDoubleClickAction(on window: NSWindow) {
        switch UserDefaults.standard.string(forKey: "AppleActionOnDoubleClick")?.lowercased() {
        case "minimize":
            window.miniaturize(nil)
        case "none":
            break
        default:
            window.zoom(nil)
        }
    }
}
