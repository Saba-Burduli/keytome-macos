import SwiftUI

struct HeaderView: View {
    @Bindable var session: KeytomeSession
    let keyboardTarget: FocusState<KeyboardTarget?>.Binding

    var body: some View {
        promptBar
            .padding(.top, 40)
            .padding(.horizontal, 18)
            .padding(.bottom, 10)
            .background(GlassSurface(opaque: KeytomeTheme.background))
            .accessibilityElement(children: .contain)
    }

    @ViewBuilder
    private var promptBar: some View {
        HStack(spacing: 10) {
            Text(session.mode == .search ? "/" : ":")
                .font(.system(size: 17, weight: .bold, design: .monospaced))
                .foregroundStyle(KeytomeTheme.accent)

            if session.mode == .normal {
                Text(session.query.isEmpty ? "Press / to search or : for commands" : session.query)
                    .font(.system(size: 14, weight: .medium, design: .monospaced))
                    .foregroundStyle(session.query.isEmpty ? KeytomeTheme.muted : .primary)
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
                .foregroundStyle(KeytomeTheme.muted)
                .padding(.horizontal, 8)
                .padding(.vertical, 5)
                .background(KeytomeTheme.elevatedSurface, in: RoundedRectangle(cornerRadius: 4))
        }
        .padding(.horizontal, 14)
        .frame(height: 46)
        .background(Color.black.opacity(0.24), in: RoundedRectangle(cornerRadius: 7))
        .overlay {
            RoundedRectangle(cornerRadius: 7)
                .stroke(session.mode == .normal ? KeytomeTheme.borderStrong : KeytomeTheme.accent.opacity(0.65))
        }
    }

    private var modeColor: Color {
        switch session.mode {
        case .normal: KeytomeTheme.accent
        case .search: KeytomeTheme.blue
        case .command: KeytomeTheme.amber
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
