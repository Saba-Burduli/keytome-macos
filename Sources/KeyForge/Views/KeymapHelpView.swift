import SwiftUI

struct KeymapHelpView: View {
    let dismiss: () -> Void

    private let bindings = [
        ("j / k", "next / previous reference"),
        ("h / l", "previous / next shortcut pack"),
        ("gg / G", "first / last reference"),
        ("/", "enter incremental search"),
        ("n / N", "next / previous result"),
        (":", "open command mode"),
        ("y / Enter", "copy selected keybind or command"),
        ("Esc", "return to NORMAL mode")
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 18) {
            HStack {
                Text(":help keyforge")
                    .font(.system(size: 17, weight: .bold, design: .monospaced))
                    .foregroundStyle(KeyForgeTheme.accent)
                Spacer()
                Button("Esc") { dismiss() }
                    .keyboardShortcut(.escape, modifiers: [])
            }

            Text("NORMAL MODE")
                .font(.system(size: 10, weight: .bold, design: .monospaced))
                .foregroundStyle(KeyForgeTheme.blueMuted)

            ForEach(bindings, id: \.0) { key, action in
                HStack(spacing: 18) {
                    Text(key)
                        .foregroundStyle(KeyForgeTheme.accent)
                        .frame(width: 90, alignment: .trailing)
                    Text(action)
                        .foregroundStyle(.secondary)
                }
                .font(.system(size: 12, design: .monospaced))
            }

            Divider().overlay(KeyForgeTheme.border)
            Text(":open chrome   :search copy   :next   :prev   :clear   :help")
                .font(.system(size: 11, design: .monospaced))
                .foregroundStyle(KeyForgeTheme.amber)
        }
        .padding(24)
        .frame(width: 520)
        .background(KeyForgeTheme.elevatedSurface, in: RoundedRectangle(cornerRadius: 9))
        .overlay { RoundedRectangle(cornerRadius: 9).stroke(KeyForgeTheme.accent.opacity(0.55)) }
        .shadow(color: .black.opacity(0.55), radius: 28, y: 12)
    }
}
