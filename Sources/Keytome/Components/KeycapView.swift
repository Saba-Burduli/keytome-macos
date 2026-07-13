import SwiftUI

struct ShortcutValueView: View {
    let item: ReferenceItem
    let style: PackVisualStyle
    let isSelected: Bool
    let isCompact: Bool

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
            if isCompact, chord.strokes.count > 1 {
                VStack(alignment: .leading, spacing: 6) {
                    ForEach(Array(chord.strokes.enumerated()), id: \.offset) { index, stroke in
                        strokeView(stroke, sequenceIndex: index)
                    }
                }
            } else {
                HStack(spacing: 7) {
                    ForEach(Array(chord.strokes.enumerated()), id: \.offset) { index, stroke in
                        strokeView(stroke, sequenceIndex: index)
                    }
                }
            }
        }
    }

    private var chord: ShortcutChord { ShortcutChord(item.value) }

    private func strokeView(_ stroke: ShortcutChord.Stroke, sequenceIndex: Int) -> some View {
        HStack(spacing: 4) {
            if sequenceIndex > 0 {
                Image(systemName: "chevron.right")
                    .font(.system(size: 8, weight: .bold))
                    .foregroundStyle(style.secondary.opacity(0.6))
            }
            ForEach(Array(stroke.keys.enumerated()), id: \.offset) { index, key in
                if index > 0 {
                    Text("+").foregroundStyle(style.secondary.opacity(0.55))
                }
                KeycapView(key: key, style: style, isSelected: isSelected, isCompact: isCompact)
            }
        }
        .fixedSize(horizontal: true, vertical: false)
    }
}

private struct KeycapView: View {
    let key: String
    let style: PackVisualStyle
    let isSelected: Bool
    let isCompact: Bool

    var body: some View {
        Text(key)
            .font(.system(size: 12, weight: .semibold, design: .monospaced))
            .foregroundStyle(keyForeground)
            .padding(.horizontal, isCompact ? 7 : (key.count > 2 ? 9 : 8))
            .frame(minWidth: isCompact ? 30 : 34, minHeight: isCompact ? 29 : 32)
            .background(keyBackground, in: RoundedRectangle(cornerRadius: cornerRadius))
            .overlay { RoundedRectangle(cornerRadius: cornerRadius).stroke(keyBorder, lineWidth: isSelected ? 1.4 : 1) }
            .shadow(color: keyShadow, radius: style.keycapTreatment == .glow ? 8 : 2, y: 1)
    }

    private var keyForeground: Color {
        switch style.keycapTreatment {
        case .paper: .black.opacity(0.9)
        case .terminal: isSelected ? style.accent : style.secondary
        default: isSelected ? style.accent : .primary
        }
    }

    private var keyBackground: some ShapeStyle {
        switch style.keycapTreatment {
        case .paper:
            AnyShapeStyle(
                LinearGradient(
                    colors: [style.secondary.opacity(0.96), style.accent.opacity(0.62)],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
        case .terminal:
            AnyShapeStyle(Color.black.opacity(isSelected ? 0.62 : 0.38))
        case .outlined:
            AnyShapeStyle(style.background.opacity(isSelected ? 0.9 : 0.58))
        case .glow:
            AnyShapeStyle(
                LinearGradient(
                    colors: [style.accent.opacity(isSelected ? 0.32 : 0.16), style.background.opacity(0.72)],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
        case .glass:
            AnyShapeStyle(
                LinearGradient(
                    colors: [Color.white.opacity(0.11), Color.black.opacity(0.28)],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
        }
    }

    private var keyBorder: Color {
        switch style.keycapTreatment {
        case .paper: style.secondary.opacity(isSelected ? 0.95 : 0.56)
        case .terminal: style.accent.opacity(isSelected ? 0.82 : 0.34)
        case .outlined: style.accent.opacity(isSelected ? 0.78 : 0.28)
        case .glow: style.accent.opacity(isSelected ? 0.92 : 0.42)
        case .glass: style.accent.opacity(isSelected ? 0.75 : 0.24)
        }
    }

    private var keyShadow: Color {
        switch style.keycapTreatment {
        case .glow: style.accent.opacity(isSelected ? 0.4 : 0.18)
        default: .black.opacity(0.28)
        }
    }

    private var cornerRadius: CGFloat {
        switch style.keycapTreatment {
        case .paper: 6
        case .terminal: 5
        default: 7
        }
    }
}
