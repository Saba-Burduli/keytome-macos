import SwiftUI

struct SearchField: View {
    @Binding var text: String
    let isFocused: FocusState<Bool>.Binding

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(KeyForgeTheme.accent)

            TextField("Search titles, commands, descriptions, or tags", text: $text)
                .textFieldStyle(.plain)
                .font(.system(size: 14, design: .monospaced))
                .focused(isFocused)

            Text("⌘F")
                .font(.system(size: 11, weight: .medium, design: .monospaced))
                .foregroundStyle(.tertiary)
                .padding(.horizontal, 7)
                .padding(.vertical, 3)
                .background(KeyForgeTheme.elevatedSurface, in: RoundedRectangle(cornerRadius: 4))
        }
        .padding(.horizontal, 13)
        .frame(height: 42)
        .background(KeyForgeTheme.surface, in: RoundedRectangle(cornerRadius: 7))
        .overlay {
            RoundedRectangle(cornerRadius: 7)
                .stroke(isFocused.wrappedValue ? KeyForgeTheme.accent.opacity(0.65) : KeyForgeTheme.border)
        }
    }
}
