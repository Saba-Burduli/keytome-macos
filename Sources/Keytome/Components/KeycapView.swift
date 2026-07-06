import SwiftUI

struct ShortcutValueView: View {
    let item: ReferenceItem
    let style: PackVisualStyle
    let isSelected: Bool

    var body: some View {
        if item.kind == .command {
            Text(item.value)
                .font(.system(size: 11, weight: .semibold, design: .monospaced))
                .foregroundStyle(isSelected ? style.accent : .primary)
                .textSelection(.enabled)
                .lineLimit(2)
                .padding(.horizontal, 11)
                .padding(.vertical, 8)
                .background(Color.black.opacity(0.34), in: RoundedRectangle(cornerRadius: 7))
                .overlay { RoundedRectangle(cornerRadius: 7).stroke(style.accent.opacity(isSelected ? 0.7 : 0.24)) }
        } else {
            HStack(spacing: 7) {
                ForEach(Array(ShortcutChord(item.value).strokes.enumerated()), id: \.offset) { strokeIndex, stroke in
                    if strokeIndex > 0 {
                        Image(systemName: "chevron.right")
                            .font(.system(size: 8, weight: .bold))
                            .foregroundStyle(style.secondary.opacity(0.6))
                    }
                    HStack(spacing: 4) {
                        ForEach(Array(stroke.keys.enumerated()), id: \.offset) { index, key in
                            if index > 0 {
                                Text("+").foregroundStyle(style.secondary.opacity(0.55))
                            }
                            KeycapView(key: key, style: style, isSelected: isSelected)
                        }
                    }
                }
            }
        }
    }
}

private struct KeycapView: View {
    let key: String
    let style: PackVisualStyle
    let isSelected: Bool

    var body: some View {
        Text(key)
            .font(.system(size: 12, weight: .semibold, design: .monospaced))
            .foregroundStyle(isSelected ? style.accent : .primary)
            .padding(.horizontal, key.count > 2 ? 9 : 8)
            .frame(minWidth: 34, minHeight: 32)
            .background(
                LinearGradient(
                    colors: [Color.white.opacity(0.11), Color.black.opacity(0.28)],
                    startPoint: .top,
                    endPoint: .bottom
                ),
                in: RoundedRectangle(cornerRadius: 7)
            )
            .overlay { RoundedRectangle(cornerRadius: 7).stroke(style.accent.opacity(isSelected ? 0.75 : 0.24)) }
            .shadow(color: .black.opacity(0.28), radius: 2, y: 1)
    }
}
