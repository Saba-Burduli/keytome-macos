import SwiftUI

struct SidebarView: View {
    @Bindable var session: KeytomeSession

    var body: some View {
        VStack(spacing: 0) {
            brand

            ScrollView {
                VStack(alignment: .leading, spacing: 3) {
                    Text("▾  REFERENCE PACKS")
                        .font(.system(size: 9, weight: .semibold, design: .monospaced))
                        .foregroundStyle(KeytomeTheme.blueMuted)
                        .padding(.horizontal, 18)
                        .padding(.bottom, 5)

                    packRow(title: "All References", icon: "square.stack.3d.up", count: session.totalCount, category: nil)

                    ForEach(ReferenceCategory.allCases) { category in
                        packRow(
                            title: category.rawValue,
                            icon: category.systemImage,
                            count: session.counts[category, default: 0],
                            category: category
                        )
                    }
                }
                .padding(.vertical, 8)
            }

            sidebarHints
        }
        .padding(.top, 34)
        .background(GlassSurface(opaque: KeytomeTheme.sidebar))
    }

    private var brand: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack(spacing: 9) {
                Image(systemName: "hammer.fill")
                    .foregroundStyle(KeytomeTheme.accent)
                Text("KEYTOME")
                    .font(.system(size: 19, weight: .bold, design: .monospaced))
                    .tracking(1.8)
                    .foregroundStyle(KeytomeTheme.accent)
            }
            Text("shortcut index")
                .font(.system(size: 11, design: .monospaced))
                .foregroundStyle(KeytomeTheme.blueMuted)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 20)
        .padding(.bottom, 14)
    }

    private func packRow(
        title: String,
        icon: String,
        count: Int,
        category: ReferenceCategory?
    ) -> some View {
        let isSelected = session.category == category
        let accent = category.map { PackVisualStyle(category: $0).accent } ?? PackVisualStyle.index.accent
        return Button {
            session.selectCategory(category)
        } label: {
            HStack(spacing: 10) {
                Text(isSelected ? "▸" : " ")
                    .foregroundStyle(accent)
                    .frame(width: 8)
                Image(systemName: icon)
                    .foregroundStyle(isSelected ? accent : .secondary)
                    .frame(width: 18)
                Text(title)
                    .font(.system(size: 12, weight: isSelected ? .semibold : .regular, design: .monospaced))
                    .foregroundStyle(isSelected ? accent : .primary)
                Spacer()
                Text(count.formatted())
                    .font(.system(size: 10, design: .monospaced).monospacedDigit())
                    .foregroundStyle(isSelected ? accent : KeytomeTheme.muted)
            }
            .padding(.horizontal, 14)
            .frame(height: 34)
            .background(isSelected ? accent.opacity(0.105) : .clear, in: RoundedRectangle(cornerRadius: 5))
            .overlay {
                if isSelected {
                    RoundedRectangle(cornerRadius: 5).stroke(accent.opacity(0.55))
                }
            }
            .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
        .padding(.horizontal, 8)
        .accessibilityLabel("\(title), \(count) references")
        .accessibilityAddTraits(isSelected ? [.isSelected] : [])
    }

    private var sidebarHints: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("NAVIGATION")
                .foregroundStyle(KeytomeTheme.blueMuted)
            Text("h/l  switch pack")
            Text("j/k  move cursor")
            Text("gg/G first / last")
        }
        .font(.system(size: 9, design: .monospaced))
        .foregroundStyle(KeytomeTheme.muted)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 16)
        .padding(.vertical, 10)
        .overlay(alignment: .top) {
            Rectangle().fill(KeytomeTheme.border).frame(height: 1)
        }
    }
}
