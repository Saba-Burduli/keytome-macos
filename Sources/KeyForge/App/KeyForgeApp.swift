import AppKit
import SwiftUI

@main
struct KeyForgeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .defaultSize(width: 1280, height: 800)
        .windowResizability(.contentMinSize)
        .windowStyle(.hiddenTitleBar)
    }
}
