import AppKit
import SwiftUI

@main
struct KeytomeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .defaultSize(width: 1280, height: 800)
        .windowResizability(.contentMinSize)
        .windowStyle(.hiddenTitleBar)
        .commands {
            CommandMenu("Keytome") {
                Button("Command Palette") { AppCommand.commandPalette.send() }
                    .keyboardShortcut("k", modifiers: .command)
                Button("Search References") { AppCommand.search.send() }
                    .keyboardShortcut("f", modifiers: .command)

                Divider()

                Button("Copy Selected Reference") { AppCommand.copy.send() }
                    .keyboardShortcut("c", modifiers: .command)
                Button("Show Keyboard Help") { AppCommand.help.send() }
                    .keyboardShortcut("?", modifiers: .command)
            }

            CommandMenu("Navigate") {
                Button("Next Reference") { AppCommand.next.send() }
                    .keyboardShortcut(.downArrow, modifiers: [])
                Button("Previous Reference") { AppCommand.previous.send() }
                    .keyboardShortcut(.upArrow, modifiers: [])
                Button("Next Reference Pack") { AppCommand.nextPack.send() }
                    .keyboardShortcut(.rightArrow, modifiers: [.command, .option])
                Button("Previous Reference Pack") { AppCommand.previousPack.send() }
                    .keyboardShortcut(.leftArrow, modifiers: [.command, .option])
                Divider()
                Button("First Reference") { AppCommand.first.send() }
                    .keyboardShortcut(.home, modifiers: [.command])
                Button("Last Reference") { AppCommand.last.send() }
                    .keyboardShortcut(.end, modifiers: [.command])
            }
        }
    }
}
