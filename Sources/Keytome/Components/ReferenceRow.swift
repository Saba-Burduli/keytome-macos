import SwiftUI

struct ReferenceRow: View {
    let item: ReferenceItem
    let lineNumber: Int
    let isSelected: Bool
    let style: PackVisualStyle
    let copyItem: () -> Void

    @State private var isHovering = false

    var body: some View {
        ViewThatFits(in: .horizontal) {
            regularRow
            compactRow
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
            ShortcutValueView(item: item, style: style, isSelected: isSelected)
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
            ShortcutValueView(item: item, style: style, isSelected: isSelected)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }

    private var lineAndIcon: some View {
        HStack(spacing: 9) {
            Text(lineNumber.formatted())
                .font(.system(size: 9, weight: .bold, design: .monospaced))
                .foregroundStyle(isSelected ? style.accent : style.secondary.opacity(0.5))
                .frame(width: 24, alignment: .trailing)
            Image(systemName: icon)
                .font(.system(size: 14, weight: .semibold))
                .foregroundStyle(style.accent)
                .frame(width: 36, height: 36)
                .background(style.accent.opacity(isSelected ? 0.2 : 0.1), in: RoundedRectangle(cornerRadius: 8))
                .overlay { RoundedRectangle(cornerRadius: 8).stroke(style.accent.opacity(isSelected ? 0.65 : 0.22)) }
        }
    }

    private var titleAndDescription: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack(spacing: 7) {
                Text(item.title)
                    .font(.system(size: 13, weight: isSelected ? .bold : .semibold, design: style.fontDesign))
                    .lineLimit(1)
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
                .lineLimit(2)
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
        if isSelected { return style.accent.opacity(0.16) }
        if isHovering { return style.surface.opacity(0.96) }
        return style.surface.opacity(0.76)
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
}
