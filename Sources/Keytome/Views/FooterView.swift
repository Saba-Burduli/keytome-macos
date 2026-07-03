import SwiftUI

struct FooterView: View {
    let mode: EditorMode
    let category: ReferenceCategory?
    let count: Int
    let message: String

    var body: some View {
        ViewThatFits(in: .horizontal) {
            detailedStatusline
            compactStatusline
        }
        .font(.system(size: 10, weight: .medium, design: .monospaced))
        .frame(height: 34)
        .background(KeytomeTheme.surface)
        .overlay(alignment: .top) {
            Rectangle().fill(KeytomeTheme.borderStrong).frame(height: 1)
        }
    }

    private var detailedStatusline: some View {
        HStack(spacing: 0) {
            coreSegments(includeBranch: true)
            Text(message)
                .lineLimit(1)
                .foregroundStyle(KeytomeTheme.muted)
                .padding(.leading, 14)
            Spacer(minLength: 12)
            Text("j/k move   h/l packs   / search   y copy   : command")
                .foregroundStyle(.secondary)
                .padding(.trailing, 16)
        }
    }

    private var compactStatusline: some View {
        HStack(spacing: 0) {
            coreSegments(includeBranch: false)
            Spacer(minLength: 8)
            Text("j/k · h/l · / · y · :")
                .foregroundStyle(.secondary)
                .padding(.trailing, 10)
        }
    }

    @ViewBuilder
    private func coreSegments(includeBranch: Bool) -> some View {
        StatusSegment(text: mode.rawValue, foreground: .black, background: modeColor, bold: true)
        StatusSegment(text: category?.rawValue ?? "ALL", foreground: .white, background: KeytomeTheme.blue.opacity(0.58))
        if includeBranch {
            StatusSegment(text: "branch: main", foreground: .secondary, background: KeytomeTheme.surface)
        }
        StatusSegment(text: "\(count) shortcuts", foreground: .secondary, background: KeytomeTheme.surface)
    }

    private var modeColor: Color {
        switch mode {
        case .normal: KeytomeTheme.accent
        case .search: KeytomeTheme.blue
        case .command: KeytomeTheme.amber
        }
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
            .padding(.horizontal, 12)
            .frame(height: 34)
            .background(background)
            .overlay(alignment: .trailing) {
                Rectangle().fill(KeytomeTheme.borderStrong).frame(width: 1)
            }
    }
}
