import SwiftUI

struct ReferenceRow: View {
    let item: ReferenceItem
    let isSelected: Bool

    var body: some View {
        HStack(spacing: 15) {
            VStack(alignment: .leading, spacing: 7) {
                HStack(spacing: 8) {
                    Text(item.title)
                        .font(.system(size: 14, weight: .semibold))
                    CategoryBadge(category: item.category)
                    if item.confidence == .common {
                        Text("COMMON")
                            .font(.system(size: 9, weight: .bold, design: .monospaced))
                            .foregroundStyle(.orange)
                    }
                }

                Text(item.description)
                    .font(.system(size: 12))
                    .foregroundStyle(KeyForgeTheme.muted)
                    .lineLimit(2)
            }

            Spacer(minLength: 18)

            Text(item.value)
                .font(.system(size: 13, weight: .medium, design: .monospaced))
                .foregroundStyle(KeyForgeTheme.accent)
                .textSelection(.enabled)
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .background(Color.black.opacity(0.28), in: RoundedRectangle(cornerRadius: 5))

            CopyButton(value: item.value)
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 13)
        .background(isSelected ? KeyForgeTheme.accent.opacity(0.09) : KeyForgeTheme.surface)
        .overlay {
            RoundedRectangle(cornerRadius: 7)
                .stroke(isSelected ? KeyForgeTheme.accent.opacity(0.55) : KeyForgeTheme.border)
        }
        .clipShape(RoundedRectangle(cornerRadius: 7))
        .contentShape(Rectangle())
    }
}

private struct CategoryBadge: View {
    let category: ReferenceCategory

    var body: some View {
        Text(category.rawValue.uppercased())
            .font(.system(size: 9, weight: .semibold, design: .monospaced))
            .foregroundStyle(.secondary)
            .padding(.horizontal, 6)
            .padding(.vertical, 3)
            .background(KeyForgeTheme.elevatedSurface, in: RoundedRectangle(cornerRadius: 3))
    }
}
