import SwiftUI

struct ReferenceRow: View {
    let item: ReferenceItem
    let lineNumber: Int
    let isSelected: Bool
    let isCompact: Bool
    let style: PackVisualStyle
    let copyItem: () -> Void

    @State private var isHovering = false

    var body: some View {
        Group {
            if isCompact {
                compactRow
            } else {
                regularRow
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 11)
        .background(rowBackground, in: RoundedRectangle(cornerRadius: 10))
        .overlay { RoundedRectangle(cornerRadius: 10).stroke(rowBorder, lineWidth: isSelected ? 1.5 : 1) }
        .shadow(color: isSelected ? style.accent.opacity(0.13) : .clear, radius: 10)
        .contentShape(Rectangle())
        .onHover { isHovering = $0 }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("\(item.title), \(item.value)")
        .accessibilityValue(item.description)
        .accessibilityHint("Press Return or Y to copy")
        .accessibilityAddTraits(isSelected ? [.isSelected] : [])
    }

    private var regularRow: some View {
        HStack(spacing: 14) {
            lineAndIcon
            titleAndDescription.frame(minWidth: 180, maxWidth: .infinity, alignment: .leading)
            ShortcutValueView(item: item, style: style, isSelected: isSelected, isCompact: false)
                .frame(minWidth: 150, idealWidth: 230, maxWidth: 320, alignment: .leading)
            copyButton
        }
    }

    private var compactRow: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(alignment: .top, spacing: 12) {
                lineAndIcon
                titleAndDescription
                Spacer(minLength: 4)
                copyButton
            }
            ShortcutValueView(item: item, style: style, isSelected: isSelected, isCompact: true)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }

    private var lineAndIcon: some View {
        HStack(spacing: style.rowTreatment == .denseTable ? 7 : 9) {
            if style.rowTreatment == .numberedCards {
                Text(lineNumber.formatted())
                    .font(.system(size: 11, weight: .bold, design: .monospaced))
                    .foregroundStyle(isSelected ? .black : style.accent)
                    .frame(width: 28, height: 28)
                    .background(isSelected ? style.accent : style.accent.opacity(0.12), in: Circle())
                    .overlay { Circle().stroke(style.accent.opacity(isSelected ? 0.8 : 0.36)) }
            } else if style.rowTreatment != .denseTable {
                Text(lineNumber.formatted())
                    .font(.system(size: 9, weight: .bold, design: .monospaced))
                    .foregroundStyle(isSelected ? style.accent : style.secondary.opacity(0.5))
                    .frame(width: 24, alignment: .trailing)
            }
            Image(systemName: icon)
                .font(.system(size: iconSize, weight: .semibold))
                .foregroundStyle(iconForeground)
                .frame(width: iconFrame, height: iconFrame)
                .background(iconBackground, in: iconShape)
                .overlay { iconShape.stroke(style.accent.opacity(isSelected ? 0.65 : 0.22)) }
        }
    }

    private var titleAndDescription: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack(spacing: 7) {
                Text(item.title)
                    .font(.system(size: style.rowTreatment == .denseTable ? 12 : 13, weight: isSelected ? .bold : .semibold, design: style.fontDesign))
                    .lineLimit(isCompact ? 2 : 1)
                    .layoutPriority(1)
                if item.confidence == .common {
                    Text("COMMON")
                        .font(.system(size: 7, weight: .bold, design: .monospaced))
                        .foregroundStyle(KeytomeTheme.amber)
                        .padding(.horizontal, 5)
                        .padding(.vertical, 2)
                        .background(KeytomeTheme.amber.opacity(0.12), in: Capsule())
                }
            }
            Text(item.description)
                .font(.system(size: 11, weight: .regular, design: style.fontDesign))
                .foregroundStyle(isSelected ? Color.primary.opacity(0.86) : style.secondary.opacity(0.65))
                .lineLimit(style.rowTreatment == .denseTable ? 1 : 2)
        }
    }

    private var copyButton: some View {
        Button(action: copyItem) {
            Image(systemName: "doc.on.doc")
                .font(.system(size: 11, weight: .semibold))
                .foregroundStyle(isSelected || isHovering ? style.accent : .secondary.opacity(0.28))
                .frame(width: 30, height: 30)
                .background((isSelected || isHovering) ? style.accent.opacity(0.1) : .clear, in: RoundedRectangle(cornerRadius: 6))
        }
        .buttonStyle(.plain)
        .accessibilityLabel("Copy \(item.title)")
    }

    private var rowBackground: Color {
        switch style.rowTreatment {
        case .denseTable:
            if isSelected { return style.accent.opacity(0.13) }
            if isHovering { return style.surface.opacity(0.82) }
            return style.background.opacity(0.42)
        case .numberedCards:
            if isSelected { return style.accent.opacity(0.18) }
            if isHovering { return style.surface.opacity(0.98) }
            return style.surface.opacity(0.72)
        case .commandTable, .iconCards:
            if isSelected { return style.accent.opacity(0.16) }
            if isHovering { return style.surface.opacity(0.96) }
            return style.surface.opacity(0.76)
        }
    }

    private var rowBorder: Color {
        if isSelected { return style.accent.opacity(0.78) }
        if isHovering { return style.accent.opacity(0.32) }
        return style.accent.opacity(0.12)
    }

    private var icon: String {
        if item.kind == .command { return "chevron.right" }
        return ReferenceGroup.resolve(item).systemImage
    }

    private var iconSize: CGFloat {
        switch style.rowTreatment {
        case .denseTable: 12
        case .numberedCards: 13
        default: 14
        }
    }

    private var iconFrame: CGFloat {
        switch style.rowTreatment {
        case .denseTable: 30
        case .numberedCards: 34
        default: 36
        }
    }

    private var iconForeground: Color {
        switch style.keycapTreatment {
        case .paper where isSelected: .black
        default: style.accent
        }
    }

    private var iconBackground: Color {
        switch style.keycapTreatment {
        case .paper:
            isSelected ? style.secondary.opacity(0.9) : style.secondary.opacity(0.14)
        case .terminal:
            isSelected ? style.accent.opacity(0.22) : Color.black.opacity(0.34)
        case .outlined:
            isSelected ? style.accent.opacity(0.18) : style.background.opacity(0.58)
        case .glow:
            style.accent.opacity(isSelected ? 0.24 : 0.12)
        case .glass:
            style.accent.opacity(isSelected ? 0.2 : 0.1)
        }
    }

    private var iconShape: RoundedRectangle {
        RoundedRectangle(cornerRadius: style.rowTreatment == .denseTable ? 6 : 8)
    }
}
