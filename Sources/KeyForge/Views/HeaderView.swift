import SwiftUI

struct HeaderView: View {
    @Bindable var session: KeyForgeSession
    let keyboardTarget: FocusState<KeyboardTarget?>.Binding

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            promptBar

            HStack(alignment: .firstTextBaseline) {
                VStack(alignment: .leading, spacing: 5) {
                    Text("\(session.category?.rawValue ?? "All") Shortcuts")
                        .font(.system(size: 27, weight: .bold, design: .monospaced))
                    Text(subtitle)
                        .font(.system(size: 13, weight: .medium, design: .monospaced))
                        .foregroundStyle(KeyForgeTheme.blueMuted)
                }
                Spacer()
                Text("⌘K  command palette")
                    .font(.system(size: 11, design: .monospaced))
                    .foregroundStyle(KeyForgeTheme.blueMuted)
            }
        }
        .padding(.top, 24)
        .padding(.horizontal, 26)
        .padding(.bottom, 18)
        .background(KeyForgeTheme.background)
        .accessibilityElement(children: .contain)
    }

    @ViewBuilder
    private var promptBar: some View {
        HStack(spacing: 10) {
            Text(session.mode == .search ? "/" : ":")
                .font(.system(size: 17, weight: .bold, design: .monospaced))
                .foregroundStyle(KeyForgeTheme.accent)

            if session.mode == .normal {
                Text(session.query.isEmpty ? "Press / to search or : for commands" : session.query)
                    .font(.system(size: 14, weight: .medium, design: .monospaced))
                    .foregroundStyle(session.query.isEmpty ? KeyForgeTheme.muted : .primary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .contentShape(Rectangle())
                    .onTapGesture { session.beginSearch() }
            } else {
                TextField(
                    session.mode == .search ? "search shortcuts" : "open chrome · help",
                    text: session.mode == .search ? $session.query : $session.commandText
                )
                .textFieldStyle(.plain)
                .font(.system(size: 14, weight: .medium, design: .monospaced))
                .focused(keyboardTarget, equals: .prompt)
                .onSubmit(submitPrompt)
                .onExitCommand { session.returnToNormal() }
                .accessibilityLabel(session.mode == .search ? "Search references" : "Command palette")
            }

            Text(session.mode.rawValue)
                .font(.system(size: 10, weight: .bold, design: .monospaced))
                .foregroundStyle(modeColor)

            Text("Esc normal")
                .font(.system(size: 10, design: .monospaced))
                .foregroundStyle(KeyForgeTheme.muted)
                .padding(.horizontal, 8)
                .padding(.vertical, 5)
                .background(KeyForgeTheme.elevatedSurface, in: RoundedRectangle(cornerRadius: 4))
        }
        .padding(.horizontal, 14)
        .frame(height: 46)
        .background(Color.black.opacity(0.24), in: RoundedRectangle(cornerRadius: 7))
        .overlay {
            RoundedRectangle(cornerRadius: 7)
                .stroke(session.mode == .normal ? KeyForgeTheme.borderStrong : KeyForgeTheme.accent.opacity(0.65))
        }
    }

    private var subtitle: String {
        switch session.category {
        case .macOS: "System & Finder"
        case .terminal: "Terminal.app & shell editing"
        case .homebrew: "Packages, services & Brewfiles"
        case .zsh: "Shell commands & composition"
        case .vimNvim: "Default Normal-mode keybinds"
        case nil: "All local reference packs"
        default: "Browser navigation & developer tools"
        }
    }

    private var modeColor: Color {
        switch session.mode {
        case .normal: KeyForgeTheme.accent
        case .search: KeyForgeTheme.blue
        case .command: KeyForgeTheme.amber
        }
    }

    private func submitPrompt() {
        if session.mode == .command {
            _ = session.executeCommand()
        } else {
            session.returnToNormal()
        }
    }
}
