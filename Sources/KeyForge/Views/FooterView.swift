import SwiftUI

struct FooterView: View {
    var body: some View {
        HStack(spacing: 16) {
            Label("search", systemImage: "command")
            Text("F")
            Label("copy selected", systemImage: "command")
            Text("C")
            Text("esc clear")
            Spacer()
            Text("KeyForge · local only")
        }
        .font(.system(size: 10, design: .monospaced))
        .foregroundStyle(.tertiary)
        .padding(.horizontal, 20)
        .frame(height: 32)
        .background(KeyForgeTheme.surface)
        .overlay(alignment: .top) {
            Rectangle().fill(KeyForgeTheme.border).frame(height: 1)
        }
    }
}
