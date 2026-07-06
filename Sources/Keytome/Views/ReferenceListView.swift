import SwiftUI

struct ReferenceListView: View {
    @Environment(\.accessibilityReduceMotion) private var reduceMotion

    @Bindable var session: KeytomeSession
    let copyItem: (ReferenceItem) -> Void
    var contentState: PackContentState = .ready

    private var style: PackVisualStyle {
        session.category.map(PackVisualStyle.init(category:)) ?? .index
    }

    var body: some View {
        ScrollViewReader { proxy in
            ZStack {
                PackDesignBackground(style: style)

                VStack(spacing: 0) {
                    PackHeaderView(session: session, style: style)
                    tableHeader
                    content
                }
            }
            .onChange(of: session.selectedItemID) { _, selectedID in
                guard let selectedID else { return }
                withAnimation(reduceMotion ? nil : .easeOut(duration: 0.12)) {
                    proxy.scrollTo(selectedID, anchor: .center)
                }
            }
        }
    }

    @ViewBuilder
    private var content: some View {
        if contentState == .loading {
            LoadingPackView(style: style)
        } else if session.visibleItems.isEmpty {
            EmptyResultsView(
                query: session.query,
                group: session.selectedGroup,
                accent: style.accent,
                clearFilters: clearFilters
            )
        } else {
            ScrollView {
                LazyVStack(spacing: 8) {
                    ForEach(Array(session.visibleItems.enumerated()), id: \.element.id) { index, item in
                        ReferenceRow(
                            item: item,
                            lineNumber: index + 1,
                            isSelected: session.selectedItemID == item.id,
                            style: style,
                            copyItem: { copyItem(item) }
                        )
                        .id(item.id)
                        .onTapGesture { session.selectedItemID = item.id }
                        .contextMenu { Button("Yank \(item.kind.rawValue)") { copyItem(item) } }
                    }
                }
                .frame(maxWidth: 1120)
                .padding(.horizontal, 12)
                .padding(.vertical, 10)
                .frame(maxWidth: .infinity)
            }
        }
    }

    private var tableHeader: some View {
        HStack {
            Text("ACTION")
            Spacer()
            Text("SHORTCUT / COMMAND")
        }
        .font(.system(size: 9, weight: .bold, design: .monospaced))
        .foregroundStyle(style.secondary.opacity(0.7))
        .padding(.horizontal, 28)
        .frame(height: 32)
        .background(style.background.opacity(0.86))
        .overlay(alignment: .bottom) { Rectangle().fill(style.accent.opacity(0.14)).frame(height: 1) }
    }

    private func clearFilters() {
        session.query = ""
        session.selectGroup(nil)
        session.updateSearch()
    }
}
