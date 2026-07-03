import SwiftUI

struct EmptyResultsView: View {
    var body: some View {
        VStack(spacing: 12) {
            Image(systemName: "text.magnifyingglass")
                .font(.system(size: 31, weight: .light))
                .foregroundStyle(KeytomeTheme.accent)
            Text("No matching references")
                .font(.system(size: 16, weight: .semibold, design: .monospaced))
            Text("Try a shorter query or choose another pack.")
                .font(.system(size: 12))
                .foregroundStyle(KeytomeTheme.muted)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(KeytomeTheme.background)
        .accessibilityElement(children: .combine)
        .accessibilityLabel("No matching references. Try a shorter query or choose another pack.")
    }
}
