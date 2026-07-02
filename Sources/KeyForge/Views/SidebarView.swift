import SwiftUI

struct SidebarView: View {
    @Binding var selection: ReferenceCategory?
    let counts: [ReferenceCategory: Int]
    let totalCount: Int

    var body: some View {
        List(selection: $selection) {
            Section {
                SidebarRow(
                    title: "All references",
                    systemImage: "square.grid.2x2",
                    count: totalCount
                )
                .tag(nil as ReferenceCategory?)
            }

            Section("Packs") {
                ForEach(ReferenceCategory.allCases) { category in
                    SidebarRow(
                        title: category.rawValue,
                        systemImage: category.systemImage,
                        count: counts[category, default: 0]
                    )
                    .tag(category as ReferenceCategory?)
                }
            }
        }
        .listStyle(.sidebar)
        .safeAreaInset(edge: .top) {
            BrandView()
        }
    }
}

private struct SidebarRow: View {
    let title: String
    let systemImage: String
    let count: Int

    var body: some View {
        HStack(spacing: 9) {
            Image(systemName: systemImage)
                .foregroundStyle(KeyForgeTheme.accent)
                .frame(width: 17)
            Text(title)
                .lineLimit(1)
            Spacer()
            Text(count.formatted())
                .font(.caption.monospacedDigit())
                .foregroundStyle(.tertiary)
        }
        .padding(.vertical, 3)
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
