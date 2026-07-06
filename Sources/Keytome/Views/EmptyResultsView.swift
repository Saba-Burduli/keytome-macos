import SwiftUI

struct EmptyResultsView: View {
    let query: String
    let group: ReferenceGroup?
    let accent: Color
    let clearFilters: () -> Void

    var body: some View {
        VStack(spacing: 13) {
            Image(systemName: "text.magnifyingglass")
                .font(.system(size: 32, weight: .light))
                .foregroundStyle(accent)
            Text("No matching shortcuts")
                .font(.system(size: 16, weight: .semibold, design: .monospaced))
            Text(detail)
                .font(.system(size: 12))
                .foregroundStyle(KeytomeTheme.muted)
                .multilineTextAlignment(.center)
            Button("Clear filters", action: clearFilters)
                .buttonStyle(.bordered)
                .tint(accent)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(28)
        .accessibilityElement(children: .combine)
        .accessibilityLabel("No matching shortcuts. \(detail)")
    }

    private var detail: String {
        if !query.isEmpty, let group {
            return "Nothing in \(group.title) matches “\(query)”."
        }
        if !query.isEmpty { return "Nothing matches “\(query)”." }
        if let group { return "The \(group.title) group has no shortcuts." }
        return "Try a shorter query or choose another pack."
    }
}
