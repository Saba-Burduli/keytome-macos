import SwiftUI

struct FooterView: View {
    let mode: EditorMode
    let category: ReferenceCategory?
    let group: ReferenceGroup?
    let selectedItem: ReferenceItem?
    let selectedIndex: Int?
    let count: Int
    let query: String
    let message: String

    var body: some View {
        ViewThatFits(in: .horizontal) {
            detailedStatusline
            compactStatusline
        }
        .font(.system(size: 10, weight: .medium, design: .monospaced))
        .frame(height: 34)
        .background(GlassSurface(opaque: KeytomeTheme.surface, tint: packStyle.accent))
        .overlay(alignment: .top) { Rectangle().fill(KeytomeTheme.borderStrong).frame(height: 1) }
    }

    private var detailedStatusline: some View {
        HStack(spacing: 0) {
            coreSegments(includePath: true)
            Text(contextMessage)
                .lineLimit(1)
                .foregroundStyle(KeytomeTheme.muted)
                .padding(.leading, 12)
            Spacer(minLength: 10)
            Text(hints)
                .foregroundStyle(.secondary)
                .padding(.trailing, 14)
        }
    }

    private var compactStatusline: some View {
        HStack(spacing: 0) {
            coreSegments(includePath: false)
            Spacer(minLength: 6)
            Text("j/k · h/l · / · y · :")
                .foregroundStyle(.secondary)
                .padding(.trailing, 9)
        }
    }

    @ViewBuilder
    private func coreSegments(includePath: Bool) -> some View {
        StatusSegment(text: mode.rawValue, foreground: .black, background: modeColor, bold: true)
        StatusSegment(text: category?.rawValue ?? "ALL", foreground: .white, background: packStyle.accent.opacity(0.58))
        if includePath {
            StatusSegment(text: path, foreground: .secondary, background: KeytomeTheme.surface)
        }
        StatusSegment(text: position, foreground: .secondary, background: KeytomeTheme.surface)
    }

    private var packStyle: PackVisualStyle { category.map(PackVisualStyle.init(category:)) ?? .index }
    private var path: String { "packs/\(slug(category?.rawValue ?? "all"))/\(slug(group?.title ?? "all"))" }
    private var position: String { selectedIndex.map { "\($0 + 1)/\(count)" } ?? "0/\(count)" }

    private var contextMessage: String {
        if mode == .search, !query.isEmpty { return "/\(query) · \(count) matches" }
        if let selectedItem { return "\(selectedItem.title) · \(selectedItem.value)" }
        return message
    }

    private var hints: String {
        switch mode {
        case .normal: "j/k move   h/l packs   / search   y copy   : command"
        case .search: "Enter confirm   Esc normal"
        case .command: "Enter execute   Esc normal"
        }
    }

    private var modeColor: Color {
        switch mode {
        case .normal: KeytomeTheme.accent
        case .search: KeytomeTheme.blue
        case .command: KeytomeTheme.amber
        }
    }

    private func slug(_ value: String) -> String {
        value.lowercased().replacingOccurrences(of: " / ", with: "-").replacingOccurrences(of: " ", with: "-")
    }
}

private struct StatusSegment: View {
    let text: String
    let foreground: Color
    let background: Color
    var bold = false

    var body: some View {
        Text(text)
            .fontWeight(bold ? .bold : .medium)
            .foregroundStyle(foreground)
            .lineLimit(1)
            .padding(.horizontal, 10)
            .frame(height: 34)
            .background(background)
            .overlay(alignment: .trailing) { Rectangle().fill(KeytomeTheme.borderStrong).frame(width: 1) }
    }
}
