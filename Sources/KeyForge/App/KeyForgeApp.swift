import AppKit
import SwiftUI

@main
struct KeyForgeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .defaultSize(width: 1100, height: 720)
        .windowResizability(.contentMinSize)
    }
}
