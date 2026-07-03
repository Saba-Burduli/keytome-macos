import SwiftUI

struct ContentView: View {
    @Environment(\.accessibilityReduceMotion) private var reduceMotion
    @State private var session = KeytomeSession()
    @FocusState private var keyboardTarget: KeyboardTarget?
    @State private var pendingG = false

    var body: some View {
        ZStack {
            HStack(spacing: 0) {
                SidebarView(session: session)
                    .frame(minWidth: 190, idealWidth: 240, maxWidth: 260)

                Rectangle()
                    .fill(KeytomeTheme.borderStrong)
                    .frame(width: 1)

                VStack(spacing: 0) {
                    HeaderView(session: session, keyboardTarget: $keyboardTarget)

                    ReferenceListView(
                        items: session.visibleItems,
                        selectedItemID: session.selectedItemID,
                        selectItem: { session.selectedItemID = $0 },
                        copyItem: copy
                    )

                    FooterView(
                        mode: session.mode,
                        category: session.category,
                        count: session.visibleItems.count,
                        message: session.statusMessage
                    )
                }
            }

            if session.showsHelp {
                KeymapHelpView { closeHelp() }
            }
        }
        .frame(minWidth: 760, minHeight: 500)
        .background(KeytomeTheme.background)
        .overlay(alignment: .top) {
            WindowDragRegion()
                .frame(height: 34)
                .padding(.leading, 80)
                .accessibilityHidden(true)
        }
        .preferredColorScheme(.dark)
        .focusable()
        .focusEffectDisabled()
        .focused($keyboardTarget, equals: .canvas)
        .task { keyboardTarget = .canvas }
        .onChange(of: session.mode) { _, mode in
            Task { @MainActor in
                await Task.yield()
                keyboardTarget = mode == .normal ? .canvas : .prompt
            }
        }
        .onChange(of: session.query) { _, _ in session.updateSearch() }
        .onKeyPress(phases: .down, action: handleKeyPress)
        .onReceive(NotificationCenter.default.publisher(for: AppCommand.notification)) { notification in
            guard let rawValue = notification.object as? String,
                  let command = AppCommand(rawValue: rawValue) else { return }
            handle(command)
        }
    }

    private func handleKeyPress(_ press: KeyPress) -> KeyPress.Result {
        if press.modifiers == .command && press.characters.lowercased() == "f" {
            session.beginSearch()
            return .handled
        }
        if press.modifiers == .command && press.characters.lowercased() == "k" {
            session.beginCommand()
            return .handled
        }
        if press.modifiers == .command && press.characters.lowercased() == "c" {
            copySelection()
            return .handled
        }
        if press.key == .escape {
            if session.showsHelp {
                closeHelp()
            } else {
                session.returnToNormal()
            }
            return .handled
        }

        guard session.mode == .normal, press.modifiers.subtracting(.shift).isEmpty else { return .ignored }

        switch press.characters {
        case "j", "n":
            session.moveSelection(by: 1)
        case "k", "N":
            session.moveSelection(by: -1)
        case "h":
            session.switchCategory(by: -1)
        case "l":
            session.switchCategory(by: 1)
        case "/":
            session.beginSearch()
        case ":":
            session.beginCommand()
        case "y":
            copySelection()
        case "g":
            if pendingG {
                session.moveToBoundary(first: true)
                pendingG = false
            } else {
                pendingG = true
                session.statusMessage = "g"
            }
        case "G":
            session.moveToBoundary(first: false)
            pendingG = false
        case "?":
            session.showsHelp = true
        default:
            if press.key == .return {
                copySelection()
            } else {
                pendingG = false
                return .ignored
            }
        }
        return .handled
    }

    private func copySelection() {
        guard let item = session.selectedItem else { return }
        copy(item)
    }

    private func copy(_ item: ReferenceItem) {
        Pasteboard.copy(item.value)
        session.statusMessage = "yanked: \(item.value)"
        AccessibilityAnnouncer.announce("Copied \(item.value)")
    }

    private func closeHelp() {
        session.showsHelp = false
        session.returnToNormal()
        keyboardTarget = .canvas
    }

    private func handle(_ command: AppCommand) {
        switch command {
        case .commandPalette: session.beginCommand()
        case .search: session.beginSearch()
        case .copy: copySelection()
        case .next: session.moveSelection(by: 1)
        case .previous: session.moveSelection(by: -1)
        case .nextPack: session.switchCategory(by: 1)
        case .previousPack: session.switchCategory(by: -1)
        case .first: session.moveToBoundary(first: true)
        case .last: session.moveToBoundary(first: false)
        case .help: session.showsHelp = true
        }
    }
}
