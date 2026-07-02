import SwiftUI

struct SidebarView: View {
    @Binding var selection: ReferenceCategory?
    let counts: [ReferenceCategory: Int]
    let totalCount: Int

    var body: some View {
        List {
            Section {
                packButton(
                    title: "All references",
                    systemImage: "square.grid.2x2",
                    count: totalCount,
                    category: nil
                )
            }

            Section("Packs") {
                ForEach(ReferenceCategory.allCases) { category in
                    packButton(
                        title: category.rawValue,
                        systemImage: category.systemImage,
                        count: counts[category, default: 0],
                        category: category
                    )
                }
            }
        }
        .listStyle(.sidebar)
        .safeAreaInset(edge: .top) {
            BrandView()
        }
    }

    private func packButton(
        title: String,
        systemImage: String,
        count: Int,
        category: ReferenceCategory?
    ) -> some View {
        Button {
            selection = category
        } label: {
            SidebarRow(
                title: title,
                systemImage: systemImage,
                count: count,
                isSelected: selection == category
            )
        }
        .buttonStyle(.plain)
        .listRowBackground(
            selection == category ? KeyForgeTheme.accent.opacity(0.12) : Color.clear
        )
    }
}

private struct SidebarRow: View {
    let title: String
    let systemImage: String
    let count: Int
    let isSelected: Bool

    var body: some View {
        HStack(spacing: 9) {
            Image(systemName: systemImage)
                .foregroundStyle(KeyForgeTheme.accent)
                .frame(width: 17)
            Text(title)
                .fontWeight(isSelected ? .semibold : .regular)
                .lineLimit(1)
            Spacer()
            Text(count.formatted())
                .font(.caption.monospacedDigit())
                .foregroundStyle(.tertiary)
        }
        .padding(.vertical, 3)
        .frame(maxWidth: .infinity, alignment: .leading)
        .contentShape(Rectangle())
    }
}

private struct BrandView: View {
    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: "hammer.fill")
                .font(.system(size: 15, weight: .semibold))
                .foregroundStyle(KeyForgeTheme.accent)
            VStack(alignment: .leading, spacing: 1) {
                Text("KEYFORGE")
                    .font(.system(size: 13, weight: .bold, design: .monospaced))
                    .tracking(1.4)
                Text("local reference index")
                    .font(.system(size: 10, design: .monospaced))
                    .foregroundStyle(.tertiary)
            }
            Spacer()
        }
        .padding(.horizontal, 14)
        .padding(.vertical, 13)
        .background(.ultraThinMaterial)
        .overlay(alignment: .bottom) {
            Rectangle().fill(KeyForgeTheme.border).frame(height: 1)
        }
    }
}
