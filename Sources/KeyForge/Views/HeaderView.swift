import SwiftUI

struct HeaderView: View {
    let category: ReferenceCategory?
    let resultCount: Int
    @Binding var query: String
    let searchIsFocused: FocusState<Bool>.Binding

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            HStack(alignment: .firstTextBaseline) {
                VStack(alignment: .leading, spacing: 4) {
                    Text(category?.rawValue ?? "All references")
                        .font(.system(size: 24, weight: .semibold, design: .rounded))
                    Text("\(resultCount) entries available offline")
                        .font(.system(size: 12, design: .monospaced))
                        .foregroundStyle(KeyForgeTheme.muted)
                }
                Spacer()
                Text("NORMAL")
                    .font(.system(size: 10, weight: .bold, design: .monospaced))
                    .foregroundStyle(KeyForgeTheme.accent)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 5)
                    .background(KeyForgeTheme.accent.opacity(0.10), in: RoundedRectangle(cornerRadius: 4))
            }

            SearchField(text: $query, isFocused: searchIsFocused)
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 19)
        .background(KeyForgeTheme.background)
    }
}
