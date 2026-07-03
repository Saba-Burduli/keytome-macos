import SwiftUI

struct ReferenceRow: View {
    let item: ReferenceItem
    let lineNumber: Int
    let isSelected: Bool

    var body: some View {
        HStack(spacing: 0) {
            Text(lineNumber.formatted())
                .foregroundStyle(isSelected ? KeyForgeTheme.accent : KeyForgeTheme.blueMuted)
                .frame(width: 42, alignment: .trailing)

            HStack(spacing: 7) {
                Text(item.title)
                    .fontWeight(isSelected ? .semibold : .regular)
                    .lineLimit(1)
                if item.confidence == .common {
                    Text("COMMON")
                        .font(.system(size: 8, weight: .bold, design: .monospaced))
                        .foregroundStyle(KeyForgeTheme.amber)
                }
            }
            .frame(minWidth: 150, idealWidth: 230, alignment: .leading)
            .padding(.leading, 20)

            Text(item.value)
                .foregroundStyle(isSelected ? KeyForgeTheme.accent : .primary)
                .lineLimit(1)
                .padding(.horizontal, 9)
                .padding(.vertical, 5)
                .background(Color.black.opacity(0.30), in: RoundedRectangle(cornerRadius: 4))
                .overlay { RoundedRectangle(cornerRadius: 4).stroke(KeyForgeTheme.borderStrong) }
                .frame(minWidth: 130, idealWidth: 190, alignment: .leading)

            Text(item.description)
                .foregroundStyle(isSelected ? .primary : KeyForgeTheme.muted)
                .lineLimit(1)
                .frame(maxWidth: .infinity, alignment: .leading)

            Image(systemName: "doc.on.doc")
                .foregroundStyle(isSelected ? KeyForgeTheme.accent : Color.clear)
                .frame(width: 42)
        }
        .font(.system(size: 12, design: .monospaced))
        .padding(.horizontal, 22)
        .frame(height: 52)
        .background(isSelected ? KeyForgeTheme.selection : Color.clear)
        .overlay {
            if isSelected {
                RoundedRectangle(cornerRadius: 5).stroke(KeyForgeTheme.accent.opacity(0.65))
            }
        }
        .overlay(alignment: .bottom) {
            Rectangle().fill(KeyForgeTheme.border).frame(height: 1)
        }
        .contentShape(Rectangle())
        .padding(.horizontal, 4)
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("\(item.title), \(item.value)")
        .accessibilityValue(item.description)
        .accessibilityAddTraits(isSelected ? [.isSelected] : [])
    }
}
