import SwiftUI

struct CopyButton: View {
    let value: String
    @State private var copied = false

    var body: some View {
        Button {
            Pasteboard.copy(value)
            copied = true
            Task {
                try? await Task.sleep(for: .seconds(1.2))
                copied = false
            }
        } label: {
            Image(systemName: copied ? "checkmark" : "doc.on.doc")
                .frame(width: 26, height: 26)
        }
        .buttonStyle(.plain)
        .foregroundStyle(copied ? KeyForgeTheme.accent : .secondary)
        .help(copied ? "Copied" : "Copy \(value)")
    }
}
